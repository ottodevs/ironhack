class Calculator

  def add(s)
    s.split(',')
    .map(&:to_i)
    .reduce(0,:+)
  end

end
