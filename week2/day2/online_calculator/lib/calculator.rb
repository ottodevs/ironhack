class Calculator
  def self.add(x, y)
    x + y
  end

  def self.substract(x, y)
    x - y
  end

  def self.multiply(x, y)
    x * y
  end

  def self.divide(x, y)
    x / y
  end
end

class Printer
  def self.print(x, y, op)
    ops = {
      add: "addition",
      substract: "substraction",
      multiply: "product",
      divide: "division"
    }
    "The #{ops[op]} of #{x} and #{y} is #{Calculator.send(op, x, y)}"
  end
end
