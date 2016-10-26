require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/calculator'
require './lib/memorizer'

get '/' do
  erb :index
end

post '/calc' do
  op = params[:operation]
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  @result_string = Printer.print(first, second, op)
  @result_num = Calculator.send(op, first, second)
  Memorizer.save(@result_num)
  erb :index
end

get '/mem' do
  @memory = Memorizer.load
  erb :index
end
