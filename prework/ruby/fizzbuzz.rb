### Methods
def fizzbuzz_translate (n, bang = false)
	word = ""
	word << "Fizz" if n % 3 == 0
	word << "Buzz" if n % 5 == 0
	if bang
		word << "Bang" if n
		.to_s.split('')
		.first.to_i == 1
	end
	word = n if word.length == 0
	return word
end

def next_loop_msg
	puts "\nNext loop
	[press enter key to continue]"
	gets
end

### Loops
(1..100).each do |n|
	puts fizzbuzz_translate n
end

next_loop_msg

n = 1
until n > 100 do
	puts fizzbuzz_translate n
	n += 1
end

next_loop_msg

(1..100).each do |n|
	puts fizzbuzz_translate n, true
end