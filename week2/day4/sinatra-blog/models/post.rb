class Post
  attr_reader :title, :text, :date, :author, :category

  def initialize(title, text, author, category = 'Uncategorized')
    @title = title
    @text = text
    @date = Time.now
    @author = author
    @category = category
  end

  def date_formatted
    @date.strftime("written on %a, %d/%m/%Y at %k:%M")
  end
end
