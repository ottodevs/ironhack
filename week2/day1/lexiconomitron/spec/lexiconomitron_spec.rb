require './lexiconomitron'

describe Lexiconomitron do

	before(:each) { @lexi = Lexiconomitron.new }

  describe "#eat_t" do
    it "removes every letter t from the input" do
    	expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
  	arr = ["This", "is", "a", "boring", "test"]
  	it "returns first and last words, reversed, after #eat_t" do
		expect(@lexi.shazam(arr)).to eq(["sih", "se"])
  	end
  end

  describe "#oompa_loompa" do
	arr = ["if", "you", "wanna", "be", "my", "lover"]
	it "returns only words with three chars or less after #eat_t" do
  		expect(@lexi.oompa_loompa(arr)).to eq(["if", "you", "be", "my"])
  	end
  end
end
