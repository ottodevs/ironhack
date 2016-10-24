require './app'

describe Calculator do

  let(:calculator) { Calculator.new }

  it "should return 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "return 2 for that number" do
    expect(calculator.add("2")).to eq(2)
  end

    it "1 + 2 = 3" do
    expect(calculator.add("1,2")).to eq(3)
  end

end
