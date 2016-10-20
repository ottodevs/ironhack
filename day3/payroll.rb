require "pry"

module SalariedPay
  def weekly_salary_from_yearly
    @yearly_salary / 52
  end
end

module HourlyPay
  def hourly_salary_for_hours
    @hourly_rate * @hours_paid
  end
end

class Employee
  attr_reader :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
end

class HourlyEmployee < Employee
  include HourlyPay

  attr_reader :hourly_rate, :hours_worked
  def initialize(name, email, hourly_rate, hours_worked)
    super(name, email)
    @hourly_rate = hourly_rate
    @hours_paid = hours_worked
  end

  def calculate_salary
    hourly_salary_for_hours
  end
end


class SalariedEmployee < Employee
  include SalariedPay

  attr_reader :yearly_salary
  def initialize(name, email, yearly_salary)
    super(name, email)
    @yearly_salary = yearly_salary
  end

  def calculate_salary
    weekly_salary_from_yearly
  end

end

class MultiPaymentEmployee < Employee
  include SalariedPay
  include HourlyPay

  attr_reader :yearly_salary, :extra_hourly_rate, :hours_worked
  def initialize(name, email, yearly_salary, extra_hourly_rate, hours_worked)
    super(name, email)
    @yearly_salary = yearly_salary
    @hourly_rate = extra_hourly_rate
    @hours_paid = hours_worked - 40
  end

  def calculate_salary
    base_salary = weekly_salary_from_yearly
    hourly_salary = hourly_salary_for_hours
    base_salary + hourly_salary
  end

end

class Payroll
  attr_reader :employees
  def initialize(employees)
    @employees = employees
  end

  def pay_employees
    employees.each do |employee|
      puts "#{employee.name}: #{employee.calculate_salary} €"
    end

    total = employees.map(&:calculate_salary).reduce(:+)
    puts "Total spent: #{total} €"
  end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

Payroll.new([josh, nizar, ted]).pay_employees

