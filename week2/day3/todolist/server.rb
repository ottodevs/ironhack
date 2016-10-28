#Inside of server.rb
require 'sinatra'
require 'sinatra/reloader'
# We're going to need to require our class files
require('./lib/Task.rb')
require('./lib/TodoList.rb')
