class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def ship
    
  end

  def empty?
    ship != coordinate
  end

  def place_ship(name)

  end

end
