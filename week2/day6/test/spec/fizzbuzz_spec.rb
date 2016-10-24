require './fizzbuzz'

describe FizzBuzz do

	let(:fb) { FizzBuzz.new }

	it "should return 'Fizz' when passing 3" do
		expect(fb.go(3)).to eq('Fizz')
	end

	it "should return 'Fizz' when passing 6" do
		expect(fb.go(6)).to eq('Fizz')
	end

	it "should return 'Buzz' when passing 5" do
		expect(fb.go(5)).to eq('Buzz')
	end

	it "should return 'Buzz' when passing 10" do
		expect(fb.go(10)).to eq('Buzz')
	end

	it "should return 'FizzBuzz' when passing 15" do
		expect(fb.go(15)).to eq('FizzBuzz')
	end

	it "should return 'n' when passing other n" do
		expect(fb.go(1)).to eq('1')
	end

end