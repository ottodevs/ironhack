class Post
  attr_reader :title, :text, :date

  def initialize(title, text)
    @title = title
    @text = text
    @date = Time.now
  end

  def date_formatted
    @date.strftime("written on %a, %d/%m/%Y at %k:%M") 
  end
end
