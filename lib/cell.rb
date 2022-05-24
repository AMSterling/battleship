class Cell
  attr_accessor :sunk
  attr_reader :coordinate, :ship, :fire_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(type)
    @ship = type
  end

  def fired_upon?
    @fire_upon
  end

  def fire_upon
    if !empty?
      @ship.hit
      @fire_upon = true
    else
      @fire_upon = true
    end
  end

  def render(render = false)
    if @fire_upon == true && @ship == nil
      "M"
    elsif @fire_upon && !empty?
      "H"
    elsif render == true && @ship != nil
      "S"
    elsif !empty? && @ship.sunk?
      "X"
    else
      "."
    end
  end
end
