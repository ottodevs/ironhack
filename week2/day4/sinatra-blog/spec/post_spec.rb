require './models/post'

describe Post do

  before :each do
    @post1 = Post.new('title1', 'text1', 'author')
    @post2 = Post.new('title2', 'text2', 'author')
    @post3 = Post.new('title3', 'text3', 'author', 'Category')
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

  describe '#author' do
    it 'should return the author' do
      expect(@post1.author).to eq('author')
      expect(@post2.author).to eq('author')
    end

    it 'should be always a string!' do
      expect(@post1.author). to be_a(String)
    end
  end

  describe '#category' do
    it 'should be Uncategorized if not defined' do
      expect(@post1.category).to eq('Uncategorized')
      expect(@post2.category).to eq('Uncategorized')
    end

    it 'should be the defined category' do
      expect(@post3.category). to eq('Category')
    end
  end
end
