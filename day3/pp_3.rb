require 'imdb'
require 'pry'

class Movies
	attr_reader :movies
	def initialize
		@movies = Hash.new
		get_movie_readings
	end

	def get_movie_readings
		movie_titles = []
		movie_titles = IO.read("movies.txt").split("\n")
		@movies = Hash[
			movie_titles.map do |x|
				[x,	Imdb::Search.new(x).movies[0].rating.round(0)]
			end
		]
	end

	def print_pretty_ratings
		height = @movies.values.max { |a, b| a <=> b }
		width = @movies.size

		until height == 0 do 
			@movies.values.each do |rating|
				if rating < height
					print "| "
				else
					print "|#"
				end
			end
			print "|"
			puts
			
			height -= 1
		end
		z=1
		i=1
		puts "#{'-' * width * 2}-"
		width.times do print "|#{z}"; z += 1; end
		print "|\n\n"
		#(1..width).times do |v| puts ("-") puts "|#{v}"}

		
		@movies.keys.each do |movie|
			puts "#{i}. #{movie}"
			i += 1
		end
	end
end

my_list = Movies.new
my_list.print_pretty_ratings

#binding.pry

#Array:
# {1, #,#,#},
