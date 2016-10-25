class ShoppingCart
  def initialize
    @items = Hash.new(0)
  end

  def add_item_to_cart(item, qty = 1)
    @items[item] += qty
  end

  def empty_cart
    @items.clear
  end

  def show
    puts "\nYour cart:"
    @items.each do |item, qty|
      final_qty = apply_deals(item.name, qty)
      puts "#{qty} #{item.name}: #{item.price * final_qty}$"
    end
  end

  def apply_deals(item, qty)
    # check conditions
    if item == "apple"
      qty / 2 + qty % 2
    elsif item == "orange"
      qty - qty / 3
    elsif item == "grape"
      free_bananas = qty / 4
      puts "You opt to #{free_bananas} free bananas, do you want them? (Y/N)"
      if gets.chomp == "Y"
        4.times { add_item_to_cart(Fruit.new "banana", 0) }
        qty
      end
    else
      qty
    end
  end
end

class Fruit
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

apple = Fruit.new "apple", 10
orange = Fruit.new "orange", 5
grape = Fruit.new "grape", 15
banana = Fruit.new "banana", 20
watermelon = Fruit.new "watermelon", 50

cart = ShoppingCart.new

#iteration 1

cart.add_item_to_cart apple
cart.add_item_to_cart banana
cart.add_item_to_cart banana

cart.show

cart.empty_cart

# iteration 2
cart.add_item_to_cart(apple, 2)
cart.add_item_to_cart(orange, 8)
cart.add_item_to_cart(banana, 2)
cart.add_item_to_cart watermelon
cart.add_item_to_cart(grape, 9)
cart.show
# 1 apple: 10$
# 2 bananas: 40$

# cart.cost = 50


# Use this table of prices
# apples     10$
# oranges     5$
# grapes     15$
# banana     20$
# watermelon 50$


{
  apple: { summer_price: 10, autumn_price: 15},
  oranges: {}
}

File.read_lines(blah).split(number_spaces)
