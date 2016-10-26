require './password'

describe PasswordChecker do 

	let(:pc) { PasswordChecker.new}

	describe '#check_password' do

		it "should return false if password is shorter than 7 characters" do
			expect(pc.check_password("person@ironhack.com", "hello")).to be false
		end

		it "should return false if password does not contain a letter" do
			expect(pc.check_password("person@ironhack.com", "1234567&")).to be false
		end

		it "should return false if password does not contain a number" do
			expect(pc.check_password("person@ironhack.com", "helloooo")).to be false
		end

		it "should return false if password does not contain a symbol" do
			expect(pc.check_password("person@ironhack.com", "helloo1o")).to be false
		end

		it "should return false if password does not contain an uppercase letter" do
			expect(pc.check_password("person@ironhack.com", "helloo$1")).to be false
		end

		it "should return false if password does not contain a lowercase letter" do
			expect(pc.check_password("person@ironhack.com", "HELLOO$1")).to be false
		end

		it "should return false if password contains username" do
			expect(pc.check_password("person@ironhack.com", "Hperson$1")).to be false
		end

		it "should return false if password contains email" do
			expect(pc.check_password("person@ironhack.com", "Hironhack$1")).to be false
		end


		it "should return true if password is longer than 7 characters & has a number & a symbol & a letter" do
			expect(pc.check_password("person@ironhack.com", "Helloo$1")).to be true
		end

	end
	
end