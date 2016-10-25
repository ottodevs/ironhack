population = {
	barcelona: 1_602_000,
	madrid: 3_165_000,
	miami: 417_650
}

# 1. Calculate the average population
avg = population.values.reduce(:+) / population.size
puts "Average population: #{avg} habs."

# 2. Print the population for each city, for example,
# Barcelona: 1602000 habs.
population.each { |k, v| puts "#{k.capitalize}: #{v} habs." }