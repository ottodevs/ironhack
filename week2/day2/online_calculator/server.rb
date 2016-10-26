require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/calculator'
require './lib/memorizer'

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

post '/calculate' do
  operation = params[:operation]
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  @result = Printer.print(first, second, operation.to_sym)
  @result_num = Calculator.send(operation, first, second)
  Memorizer.new.save(@result_num)
  erb :result
end

get '/load_mem' do
  @memory = Memorizer.new.load
  erb :result
end

# # Old calculation routes (surpassed by /calculate)
# post '/calculate_add' do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   Printer.print(first, second, :add)
# end

# post '/calculate_substract' do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   Printer.print(first, second, :substract)
# end

# post '/calculate_multiply' do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   Printer.print(first, second, :multiply)
# end

# post '/calculate_divide' do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   Printer.print(first, second, :divide)
# end
