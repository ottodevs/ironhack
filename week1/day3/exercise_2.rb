require 'pry'

class CarDealer
	def initialize(inventory)
		@inventory = inventory
	end

	def cars(brand)
		@inventory[brand]
	end

	def print_inventory
		@inventory.each { |k, v| puts "#{k}: #{v.join(", ")}"}
	end
end

# car_dealer.cars("Ford") # ["Fiesta", "Mustang"]
# car_dealer.print_inventory
# Ford: Fiesta, Mustang
# Honda: Civic, CR-V

my_inventory = {
	"Ford" => ["Fiesta", "Mustang"],
	"Honda" => ["Civic", "CR-V"]}

car_dealer = CarDealer.new(my_inventory)
car_dealer.cars("Ford") # ["Fiesta", "Mustang"]
car_dealer.print_inventory

#binding.pry