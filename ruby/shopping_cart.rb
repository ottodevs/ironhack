require 'date'

class ShoppingCart
  def initialize
    @items = []
  end

  def add_item(item)
  	if item.kind_of? Item
  	@items.push(item)
	else
  	puts "Not a valid item, can't add to shopping cart"
  	end
  end

  def checkout
  	total = 0.0
  	@items.each { |i| total += i.price }
  	total *= 90.0 / 100 if @items.size >= 5 #10% discount
  	puts "\# Your total today is $#{total.round(2)}. Have a nice day!"
  end
end

class Item 
  def initialize(name, price)
      @name = name
      @price = price
  end

  def price
      @price
  end
end

class Houseware < Item
  def price
      if @price > 100
      	@price *= 95.0 / 100 #5% discount
      else
      	@price
      end
  end
end

class Fruit < Item
  def price
      if Date.today.wday.between?(1, 5)
      	@price
      else
      	@price *= 90.0 /100 #10% discount
      end
  end
end

# Iteration One
banana = Fruit.new("Banana", 10)
orange_juice = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
vacuum_cleaner = Houseware.new("Vacuum Cleaner", 150)
anchovies = Item.new("Anchovies", 2)

puts banana.price
puts orange_juice.price
puts rice.price
puts vacuum_cleaner.price
puts anchovies.price

# Iteration Two
my_cart = ShoppingCart.new
my_cart.add_item(banana)
my_cart.add_item(orange_juice)
my_cart.add_item(rice)
my_cart.add_item(vacuum_cleaner)
my_cart.add_item(anchovies)

# Iteration Three
my_cart.checkout

joshs_cart = ShoppingCart.new
joshs_cart.add_item(orange_juice)
joshs_cart.add_item(rice)
joshs_cart.checkout