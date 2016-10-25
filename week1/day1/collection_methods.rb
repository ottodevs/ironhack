class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

# puts homes[0].name
# puts homes[1].name
# puts homes[2].name
# puts homes[3].name
# puts homes[4].name

#for pos in 0..100
#  puts homes[pos].name
#end

#homes.each { |pos| puts pos.name }

# Exercise each
# homes.each do |v|
#   puts "#{v.name} in #{v.city}\nPrice: $#{v.price} a night\n\n"
# end

# cities = homes.map do |hm|

# Exercise map
# prices_array = homes.map { |h| h.price }
# total = 0
# prices_array.each { |h| total += h }
# puts total / prices_array.size

# Exercise reduce
#puts prices_array.reduce(:+) / prices_array.size

homes2 = [
  Home.new("Maximilian's place", "France", 2, 50),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Otto's place", "Alicante", 5, 15),
  Home.new("Zoet's place", "UK", 5, 20),
  Home.new("Pepe's place", "Prague", 5, 50),
  Home.new("Maria's Place", "Berlin", 8, 60),
  Home.new("Manuel's Place", "UK", 5, 40)
]

# Exercise each
def show_homes(homes_array)
  homes_array.each do |v|
    puts "#{v.name} in #{v.city}\nPrice: $#{v.price} a night\nCapacity: #{v.capacity}\n"  
  end
    average_price = homes_array.reduce(0) { |total, n| total + n.price } / homes_array.size
    puts "Average price of your selection is: #{average_price}"
end

puts "Press 1 to order by highest price or 2 to order by lowest price or 3 to order by capacity or 4 to select a city or 5 to enter a price"
option = gets.chomp

if option == "1"
  show_homes homes2.sort { |a, b| b.price <=> a.price }
elsif option == "2"
  show_homes homes2.sort { |a, b| a.price <=> b.price }
elsif option == "3"
  show_homes homes2.sort { |a, b| a.capacity <=> b.capacity }
  
elsif option == "4"
  puts "What city would you like?"
  chosen_city = gets.chomp
  choice = homes2.select { |hm| hm.city.downcase == chosen_city.downcase }
    if choice.size > 0
      show_homes(choice)
    else
      puts "We don´t have any homes in that city yet"
    end
elsif option == "5"
  puts "What price do you want?"
  user_price = gets.chomp
  v = homes2.find { |home| home.price == user_price.to_i}
    if v != nil
      puts "#{v.name} in #{v.city}\nPrice: $#{v.price} a night\nCapacity: #{v.capacity}\n"
    else
      puts "We don´t have any homes at this price."
    end  
else
  puts "Option not recognized"
end
