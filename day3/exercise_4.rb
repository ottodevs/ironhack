class WheelCounter
	def initialize(vehicles)
		@vehicles = vehicles
	end

	def count
	puts @vehicles.map { |v| v.count }.reduce(:+)
	end
end

class NoisePrinter
	def initialize(vehicles)
		@vehicles = vehicles
	end

	def print_noises
		puts @vehicles.map(&:noise).join(", ")
	end
end

class Car
	def count; 4 end
	def noise; "broom" end
end

class Motorcycle
	def count; 2 end
	def noise; "braaaaarmrm" end
end

class Bicycle
	def count; 2 end
	def noise; "bsshh" end
end


vehicles = [Car.new, Motorcycle.new, Bicycle.new]

WheelCounter.new(vehicles).count # 4 + 2 + 2 = 8
NoisePrinter.new(vehicles).print_noises