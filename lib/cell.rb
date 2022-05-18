require 'pry'
class Cell
  attr_reader :coordinate, :ship, :fire_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship == nil
  end

  def place_ship(type)
    @ship = type
  end

  def fired_upon?
    ship.health != ship.length
  end

  def fire_upon
      ship.hit
  end

  def render
    if empty?
      "."
    # elsif empty? && fire_upon
    #   "M"
    end
  end

end
