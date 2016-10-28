require 'sinatra'
require 'sinatra/reloader' if development?

require './models/blog'
require './models/post'

blog = Blog.new
blog.add_post Post.new('Hello world!', 'I am starting a new blog, do you like it?', 'Otto', 'Insubstantial')
blog.add_post Post.new('I am breaking for lunch', 'See you this afternoon, bye', 'Otto', 'Insubstantial')
blog.add_post Post.new('I am here again', 'Hi guys, here you have another boring post about nothing important', 'Otto', 'Insubstantial')

get '/' do
  @posts = blog.latest_posts
  @cats = blog.categories

  erb :home
end

get '/post_details/:index' do
  index = params[:index].to_i
  @post = blog.latest_posts[index]
  if @post
    erb :post
  else
    redirect to('/')
  end
end

get '/category/:index' do
  @index = params[:index].to_i
  @cats = blog.categories
  @curr_category = @cats[@index]
  @posts = blog.find_by_category(@curr_category)
  erb :home
end

get '/new_post' do
  # Show the form
  @cats = blog.categories
  erb :new
end

post '/new_post' do
  # Receive the form submission
  @title = params[:title]
  @text = params[:text]
  @category = params[:category]

  blog.add_post Post.new(@title, @text, 'Otto', @category)

  redirect to('/')
end
