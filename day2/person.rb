class Person
	attr_reader :name
	attr_accessor :age

	def initialize(name, age)
		@name = name
		@age = age
	end
end

me = Person.new("Otto", 99)

# me.name = "Other" # read-only
me.age = 18
puts me.name
puts me.age