require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "This is my web page<br>
  <h1><a href=\"/about\">\| ABOUT \|</a></h1>"
end

get '/about' do
  @author = 'somebody'
  erb :about
end

get '/time' do
  @ingredients = ['cheese', 'pepperoni', 'mushrooms']
  erb :time
end

get '/users/:username' do
  @username = params[:username]

  erb :profile
end
