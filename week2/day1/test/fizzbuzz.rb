class FizzBuzz

  def go (n)
    w = ''
    w << 'Fizz' if n % 3 == 0
    w << 'Buzz' if n % 5 == 0

    w = n.to_s if w.length == 0
    return w
  end

end

### Loops
# (1..100).each do |n|
#   puts FizzBuzz.new n
# end
