require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/calculator'
require "pry"

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
  Printer.print(first, second, :add)
end

post '/calculate_substract' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  Printer.print(first, second, :substract)
end

post '/calculate_multiply' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  Printer.print(first, second, :multiply)
end

post '/calculate_divide' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  Printer.print(first, second, :divide)
end

post '/calculate' do
  operation = params[:operation]
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  Printer.print(first, second, operation)
end

