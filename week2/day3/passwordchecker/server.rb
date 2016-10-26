require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/password'

enable :sessions

get '/' do 
	session.clear
	erb :index
end

post '/login' do
	email = params[:email]
	password = params[:password]

	if PasswordChecker.new.check_password(email, password)
		session[:user] = email
		redirect to('/congratulations')
	else
		redirect to('/')
	end
end

get '/congratulations' do
	redirect to('/') unless session[:user]
	erb :congrats
end