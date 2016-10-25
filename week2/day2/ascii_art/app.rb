require 'sinatra'
require 'sinatra/reloader' if development?
require 'artii'

#we can also use ?key=value to pass params
get '/ascii/:word/?:font?/?' do
  @word = params[:word]
  @font = params[:font]

  @a = Artii::Base.new

  if @a.faces.has_key? @font
    @a = Artii::Base.new(font: @font)
  end

  @w = @a.asciify(@word)

  erb :word
end

