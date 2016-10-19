
require 'date'
require 'colorize'
require 'io/console'

class Blog

	def initialize
		@posts =[]
	end

	def add_post(post)
		@posts.push(post)
	end

	def publish_front_page(index = 0)
		system "clear"
		sorted_posts = @posts.sort_by {|post| post.date}.reverse

		sorted_posts.slice(index, 3).each { |post| post.paint }

		# num paginas
		a = (index * 1/3) + 1
		n = 0

		if sorted_posts.size % 3 == 0
			n = sorted_posts.size/3
		else
			n = (sorted_posts.size * 1/3) + 1
		end

		puts
		(1..n).each do |p|
			if  a == p
				print "#{p} ".colorize(:red)
			else
				print "#{p} "
			end
		end
		puts

		# opcion pasar pagina
		print " < > "

		input = read_char

		#action = gets.chomp.downcase
		if input == "\e[C"
			if index <= sorted_posts.size - 4
				publish_front_page(index + 3)
			else
				publish_front_page
			end
			
		elsif input == "\e[D"
			if   index >= 3
				publish_front_page(index - 3) 
			else
				publish_front_page(index + 3 * (n - 1))
			end
		else
			puts "Command not found, try again"
		end
	end

	
	def read_char
		STDIN.echo = false
		STDIN.raw!

		input = STDIN.getc.chr
		if input == "\e" then
			input << STDIN.read_nonblock(3) rescue nil
			input << STDIN.read_nonblock(2) rescue nil
		end
	ensure
		STDIN.echo = true
		STDIN.cooked!

		return input
	end


end


class Post
	attr_reader :date, :title, :text
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end

	def paint
		puts "#{@title} \n#{"*" * 14 } \n#{@text} \n#{"-" * 20}"
	end
end

class SponsoredPost < Post
	attr_reader :date, :title, :text
	def initialize(title, date, text)
		@title = "****** #{title} ******"
		@date = date
		@text = text
	end
end

ironhack_blog = Blog.new
ironhack_blog.add_post(Post.new("Post 1", Date.new(2008,12,12), "Hola a todos"))
ironhack_blog.add_post(Post.new("Post 2", Date.new(2009,2,20), "hola"))
ironhack_blog.add_post(Post.new("Post 3", Date.new(2010,12,1), "como estamos"))
ironhack_blog.add_post(Post.new("Post 4", Date.new(2011,12,12), "Hola a todos"))
ironhack_blog.add_post(Post.new("Post 5", Date.new(2012,2,20), "el texto de hoy"))
ironhack_blog.add_post(Post.new("Post 6", Date.new(2013,12,1), "como estamos"))
ironhack_blog.add_post(Post.new("Post 7", Date.new(2014,12,12), "Hola a todos"))
ironhack_blog.add_post(Post.new("Post 8", Date.new(2015,2,20), "ayudaaa"))
ironhack_blog.add_post(Post.new("Post 9", Date.new(2016,12,1), "como estamos"))
ironhack_blog.add_post(Post.new("Post 10", Date.new(2015,2,20), "ayudaaa"))
ironhack_blog.add_post(SponsoredPost.new("Post 11", Date.new(2016,12,1), "como estamos"))
ironhack_blog.add_post(Post.new("Post 12", Date.new(2012,2,20), "el texto de hoy"))
ironhack_blog.add_post(Post.new("Post 13", Date.new(2013,12,1), "como estamos"))
ironhack_blog.add_post(Post.new("Post 14", Date.new(2014,12,12), "Hola a todos"))
ironhack_blog.add_post(Post.new("Post 15", Date.new(2015,2,20), "ayudaaa"))
ironhack_blog.add_post(Post.new("Post 16", Date.new(2016,12,1), "como estamos"))
ironhack_blog.add_post(Post.new("Post 17", Date.new(2015,2,20), "ayudaaa"))
ironhack_blog.add_post(SponsoredPost.new("Post 18", Date.new(2016,12,1), "como estamos"))


ironhack_blog.publish_front_page


