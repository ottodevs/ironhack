class Car
	def initialize(noise)
		@noise = noise
	end

	def make_noise
		puts @noise
	end
end

class RacingCar < Car
	def initialize 
	# As alternative method, we could only change the @noise variable
	end

	def make_noise
		puts "BROOOOOM!"
	end
end

ferrari = RacingCar.new
ferrari.make_noise