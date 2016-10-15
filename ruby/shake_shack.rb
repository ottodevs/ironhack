class Ingredient
	attr_reader :name, :price
	
	def initialize(name, price)
		@name = name
		@price = price
	end
end

class MilkShake
	attr_reader :name
	def initialize(name)
		@name = name
		@base_price = 3
		@ingredients = []
	end

	def add_ingredient(ingredient)
		@ingredients.push(ingredient)
	end

	def price
		total_price = @base_price
		@ingredients.each do |ingredient|
			total_price += ingredient.price
		end
		total_price
	end
end

class ShakeShop
	def initialize
		@milkshakes = []
	end

	def add_milkshake(milkshake)
		@milkshakes.push(milkshake)
	end

	def checkout
		total_price = 0
		@milkshakes.each do |milkshake|
			puts "#{milkshake.name}\t#{milkshake.price}".rjust(20)
			total_price += milkshake.price
		end
		puts "TOTAL PRICE:\t#{total_price}".rjust(20)
	end
end

# Our shop
my_shake_shop = ShakeShop.new

# Some ingredients
banana = Ingredient.new("Banana", 2)
apple = Ingredient.new("Apple", 3)
peach = Ingredient.new("Peach", 4)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
ice_cream = Ingredient.new("Ice Cream", 3)

# Some milkshakes
choco_cream_milkshake = MilkShake.new "Choco Cream"
choco_cream_milkshake.add_ingredient(chocolate_chips)
choco_cream_milkshake.add_ingredient(ice_cream)

fruity_milkshake = MilkShake.new "Fruity"
fruity_milkshake.add_ingredient(apple)
fruity_milkshake.add_ingredient(banana)
fruity_milkshake.add_ingredient(peach)

improved_nizars = MilkShake.new "Improved Nizars"
improved_nizars.add_ingredient(banana)
improved_nizars.add_ingredient(chocolate_chips)
improved_nizars.add_ingredient(ice_cream)

# Add to our shop and perform checkout
my_shake_shop.add_milkshake(choco_cream_milkshake)
my_shake_shop.add_milkshake(fruity_milkshake)
my_shake_shop.add_milkshake(improved_nizars)

my_shake_shop.checkout