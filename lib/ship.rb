class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = 0
    @hit = 1
  end

  def health
    length - hit
  end

  def sunk?
    health == 0
  end

  def hit
    hit = 1
  end

end
