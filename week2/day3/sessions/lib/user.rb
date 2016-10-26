class User
  attr_reader :name, :pass

  def initialize(name, pass)
    @name = name
    @pass = pass
  end

  def valid?(name, pass)
    name == @name && pass == @pass
  end
end
