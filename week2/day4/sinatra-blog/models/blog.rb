class Blog
  attr_reader :posts

  def initialize
    @posts = []
  end

  def add_post(post)
    unless post.is_a? Post
      raise TypeError, 'not a Post object'
    end

    @posts << post
  end

  def latest_posts
    @posts.sort { |p1, p2| p2.date <=> p1.date }
  end

  def find_post_by_title(title)
  @posts.select { |p| p.title == title }
  .first
  end

  def find_by_category(category)
    @posts.select { |p| p.category == category }
  end

  def categories
    @posts.map { |p| p.category }.uniq
  end
end
