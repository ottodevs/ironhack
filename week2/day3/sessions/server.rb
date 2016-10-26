require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/user'

enable :sessions

get '/' do
  erb :home
end

post '/' do
  the_user = User.new('bob', '123')

  user = params[:user]
  pass = params[:pass]

  if the_user.valid?(user, pass)
    session[:user] = user
    session[:pass] = pass
    redirect to("/profile")
  else
    session.clear
    erb :home
  end
end

get '/profile' do
  @user = session[:user]
  @pass = session[:pass]

  erb :profile
end

get '/logout' do
  session.clear
  redirect to('/')
end
