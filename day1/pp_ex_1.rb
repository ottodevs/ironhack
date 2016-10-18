class ProgrammingLanguage
	attr_accessor :name, :age, :type

	def initialize(name, age, type)
		@name = name
		@age = age
		@type = type
	end
end

# methods

def array_printer(array)
	array.each do | language |
		puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
	end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

# each
array_printer(array_of_languages)

# map
aged_languages = array_of_languages.map do |a|
	ProgrammingLanguage.new(a.name, a.age + 1, a.type)
end
puts "\nThe programming languages aged one year are: "
array_printer(aged_languages)

# sort
sorted_array = array_of_languages.sort { |x, y| y.age <=> x.age }
puts "\nThe programming languages sorted by age are: "
array_printer(sorted_array)

# delete
no_java = array_of_languages.delete_if { |a| a.name.downcase == "java" }
puts "\nThe programming languages without java are:"
array_printer(no_java)

# shuffle
shuffled_array = sorted_array.shuffle
puts "\nThe programming languages shuffled are:"
array_printer(shuffled_array)

# select
young_languages = array_of_languages.select {|a| a.age < 10}
puts "\nThe programming languages under 10 years old are:"
array_printer(young_languages)

# clear
=begin
clear_languages = no_java.clear
puts "\neñpty:"
array_printer(clear_languages)

# keep if
just_java = array_of_languages.keep_if {|lang| lang.name.downcase =~ /[java]/}
puts "\nJust Java:"
array_printer(just_java)
=end



array_of_languages.map! { | language | language.name += "!!!"}
array_of_languages.each { | lang | puts lang }



