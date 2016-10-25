class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee

    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hourly_rate * @hours_worked
    end
end


class SalariedEmployee < Employee
	def initialize(name, email, base_salary)
		@name = name
        @email = email
        @base_salary = base_salary
     end

    def calculate_salary
      @base_salary / 52.0
    end
end


class MultiPaymentEmployee < Employee

	def initialize(name, email, base_salary, hourly_rate, hours_worked)
		@name = name
        @email = email
        @base_salary = base_salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      (@base_salary / 52.0) + (@hours_worked * @hourly_rate)
    end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end

  def pay_employees
      @employees.each {|em|
      	final_salary = 0.82 * em.calculate_salary 
      	puts "#{em.name}: #{final_salary}"}
  end

  def notify_employee(employee)
        require 'net/smtp'

      message = "
        From: Nosotros <me@nosotros.com>
        To: #{employee.name} <#{employee.email}>
        Subject: Paymnt alert

        You have been paid."

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message,  'me@nosotros.com' , employee.email
      end

  end
end



josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
otto = MultiPaymentEmployee.new('Otto', 'otto@gmail.com', 100000, 200, 20)
mariana = SalariedEmployee.new('Mariana', 'mariana@gmail.com', 200000)
jose = HourlyEmployee.new('Jose', 'jose@gmail.com', 15, 50)

employees = [josh, nizar, ted, otto, mariana, jose]


payroll = Payroll.new(employees)

payroll.pay_employees
payroll.notify_employee(otto)











