
require 'date'
require 'colorize'

class Blog

	def initialize
		@posts =[]
		@sponsored_blogs=[]
	end

	def add_post(post, sponsored = false)
		@posts.push(post)
		if sponsored
			@sponsored_blogs.push(post)
		end
	end

	def publish_front_page(index = 0)
		system "clear"
		sorted_posts = @posts.sort_by {|post| post.date}.reverse
				
		sorted_posts.slice(index, 3).each  do |post| 
			if @sponsored_blogs.include? post
				puts "#{"*" * 7 } #{post.title} #{"*" * 7}"
			else
				puts " #{post.title} "
			end
			puts "#{"*" * 14 } \n #{post.text} \n #{"-" * 20}"
		
		end

		# num paginas
		a = (index * 1/3) + 1
		puts
		(1..sorted_posts.size/3).each do |p|
			if  a == p
				print "#{p} ".colorize(:red)
			else
				print "#{p} "
			end
		end
		puts

		# opcion pasar pagina
		print "> "
		action = gets.chomp.downcase
		if action == 'next'
			publish_front_page(index + 3) if index <= sorted_posts.size - 4
		elsif action == 'prev'
			publish_front_page(index - 3) if index >= 3
		else
			puts "Command not found, try again"
		end
	end
end


	class Post
		attr_reader :date, :title, :text
		def initialize(title, date, text)
			@title = title
			@date = date
			@text = text
		end
	end

	ironhack_blog = Blog.new
	ironhack_blog.add_post(Post.new("Post 1", Date.new(2008,12,12), "Hola a todos"))
	ironhack_blog.add_post(Post.new("Post 2", Date.new(2009,2,20), "hola"))
	ironhack_blog.add_post(Post.new("Post 3", Date.new(2010,12,1), "como estamos"), true)
	ironhack_blog.add_post(Post.new("Post 4", Date.new(2011,12,12), "Hola a todos"))
	ironhack_blog.add_post(Post.new("Post 5", Date.new(2012,2,20), "el texto de hoy"))
	ironhack_blog.add_post(Post.new("Post 6", Date.new(2013,12,1), "como estamos"), true)
	ironhack_blog.add_post(Post.new("Post 7", Date.new(2014,12,12), "Hola a todos"))
	ironhack_blog.add_post(Post.new("Post 8", Date.new(2015,2,20), "ayudaaa"))
	ironhack_blog.add_post(Post.new("Post 9", Date.new(2016,12,1), "como estamos"), true)

	ironhack_blog.publish_front_page

	puts "This is red".colorize(:red)
