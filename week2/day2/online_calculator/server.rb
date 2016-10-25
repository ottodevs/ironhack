require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/calculator'

get '/' do
  erb :home
end

get '/add' do
  erb :add
end

get '/substract' do
  erb :substract
end

get '/multiply' do
  erb :multiply
end

get '/divide' do
  erb :divide
end

post '/calculate_add' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  Calculator.add(first, second)
end

post '/calculate_substract' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  Calculator.substract(first, second)
end

post '/calculate_multiply' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = first + second
  Calculator.multiply(first, second)
end

post '/calculate_divide' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = first + second
  Calculator.divide(first, second)
end


