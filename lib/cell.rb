require 'pry'
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
    if empty? == false
      @ship.hit
    end
    @fire_upon = true
  end

  def render(render = false)
    if @fire_upon && empty? == true
      "M"
    elsif @fire_upon && empty? == false
      "H"
    elsif render == true
      "S"
    # elsif @ship.hit == @ship.length
    #   "X"
    else
      "."
    end
  end
#miss , hit , sunk , show ship, .
end
