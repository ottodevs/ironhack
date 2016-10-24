require 'date'

class Date

  def season
    day_hash = month * 100 + mday
    case day_hash
    when 101..401 then :winter
    when 402..630 then :spring
    when 701..930 then :summer
    when 1001..1231 then :autumn
    end
  end
end

module Item
  FRUITS = {
    apple: { spring: 10, summer: 10, autumn: 15, winter: 12 },
    orange: { spring: 5, summer: 2, autumn: 5, winter: 5 },
    grape: { price: 15 },
    banana: { spring: 20, summer: 20, autumn: 20, winter: 21 },
    watermelon: { price: 50, sunday: 100 }
  }
end

class ShoppingCart
  include Item

  def initialize
    @items = Hash.new(0)
  end

  def add_item_to_cart(item, qty = 1)
    @items[item] += qty
    puts "Added #{item}" # TODO: goes to print method *future
  end

  def empty
    @items.clear
    puts "Cart emptied"
  end

  def show
    @items.each do |item, qty|
      puts "#{qty} #{item}: #{cost(item)}"
    end
  end

  def cost(item = nil)
    if !item # puts total cart cost
      puts "Total cost: #{total_cost}"
    else
      qty = @items[item]
      qty * unit_price(item)
    end
  end

  def total_cost
    @items.keys.inject(0) do | sum, item |
      sum + cost(item)
    end
  end

  def unit_price(item)
    d = Date.today
    season = d.season

    i = FRUITS[item]

    case
    when i.has_key?(:sunday) #sunday price
      i[:sunday] if d.sunday?
    when i.has_key?(:price) #fixed price during whole year
      i[:price]
    else #season price
      i[d.season]
    end
  end
end

cart = ShoppingCart.new

cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana

cart.show
cart.cost

# WHAT I WANT:
=begin
October 21st 2016

YOUR CART:

2 apples:          20$
  discount:       -10$
2 bananas:         40$
3 oranges:         15$
  discount:        -5$
4 grapes:          60$
  deal:
1 free bananas:     0$
======================
TOTAL COST:       120$

You have 12 items

**********************
Discounts and deals applied:
- Buy 2 apples and pay just one!
- Buy 3 oranges and pay just 2!
- Buy 4 grapes you get one banana for free if you want!
**********************
=end
