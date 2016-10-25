class Calculator
  def self.add(x, y)
    z = x + y
    puts "The addition of #{x} and #{y} is #{z}"
  end

  def self.substract(x, y)
    z = x - y
    puts "The substraction of #{x} and #{y} is #{z}"
  end

  def self.multiply(x, y)
    z = x * y
    puts "The product of #{x} and #{y} is #{z}"
  end

  def self.divide(x, y)
    z = x / y
    puts "The division of #{x} and #{y} is #{z}"
  end
end
