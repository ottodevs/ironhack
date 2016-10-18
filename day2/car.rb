class Car
	def self.other_noise # Class method
		puts "Class method"
	end

	def self.speed_control
		puts "What is the current speed?"
		puts "Too fast, man" if gets.chomp.to_i > 100
	end

	def initialize(noise)
		@noise = noise
		@cities = []
	end

	def make_noise
		puts @noise
	end

	def visit(city) # We can use Marshal standard lib for binary serialization
		@cities << city
		IO.write("cities.txt", @cities.join("\n"))
	end

	def cities # we need to check if cities.txt exists before trying to read.
		@cities = IO.read("cities.txt").split("\n")
		puts @cities
	end
end

normal_car = Car.new("Broom")
noisy_car = Car.new("BROOM")

# normal_car.make_noise
# noisy_car.make_noise

# Car.other_noise
# Car.speed_control

normal_car.visit("Barcelona")
normal_car.cities

normal_car.visit("Madrid")
normal_car.cities