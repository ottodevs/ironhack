require './models/post'

describe Post do

  before :each do
    @post1 = Post.new('title1', 'text1')
    @post2 = Post.new('title2', 'text2')
  end

  describe '#title' do
    it 'should return the title' do
      expect(@post1.title).to eq('title1')
      expect(@post2.title).to eq('title2')
    end
  end

  describe '#date' do
    it 'should return a Time type' do
      expect(@post1.date).to be_a(Time)
    end
  end

  describe '#date_formatted' do
    it 'should return a formatted date string' do
      expect(@post1.date_formatted).to be_a(String)
    end

    it 'should start with the words "written on"' do
      expect(@post1.date_formatted).to start_with('written on')
    end
  end

  describe '#text' do
    it 'should return the text' do
      expect(@post1.text).to eq('text1')
      expect(@post2.text).to eq('text2')
    end

    it 'should be always a string!' do
      expect(@post1.text). to be_a(String)
    end

  end
end
