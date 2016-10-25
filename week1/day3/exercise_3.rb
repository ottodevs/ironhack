class Engine
	def initialize(noise)
		@noise = noise
	end

	def make_noise
		puts @noise
	end
end

class Car
	def initialize(noise, engine)
		@engine = engine
		@noise = noise
	end

	def make_noise
		@engine.make_noise
		puts @noise
	end
end

noisy_engine = Engine.new("PRRRRSH")
better_engine = Engine.new("...")

noisy_car = Car.new("broom", noisy_engine)
noisy_car.make_noise

better_car = Car.new("broom", better_engine)
better_car.make_noise
