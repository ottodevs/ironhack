cities = ["miami", "madrid", "barcelona"]

cities.each { |c| puts c.capitalize }
t_length = cities.reduce(0) { |av, x| (av + x.size)}
puts t_length.to_f  / cities.size