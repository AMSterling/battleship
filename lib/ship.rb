class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = 0
  end

  def health
    @health = 3
  end

  def sunk?
    health != length
  end

  def hit
     @health - 1
  end
end
