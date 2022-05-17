class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = 0
    @damage = 0
  end

  def health
    @length - @damage
  end

  def sunk?
    health == 0
  end

  def hit
    @damage += 1
  end

end
