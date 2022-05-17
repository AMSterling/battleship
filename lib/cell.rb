class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    ship != coordinate
  end

  def place_ship(type)
    placement = type
    @ship = placement
  end

end
