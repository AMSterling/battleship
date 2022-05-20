class Board
  attr_reader :cells

  def initialize
    @cells = {
    "A1" => Cell.new("A1"),
    "A2" => Cell.new("A2"),
    "A3" => Cell.new("A3"),
    "A4" => Cell.new("A4"),
    "B1" => Cell.new("B1"),
    "B2" => Cell.new("B2"),
    "B3" => Cell.new("B3"),
    "B4" => Cell.new("B4"),
    "C1" => Cell.new("C1"),
    "C2" => Cell.new("C2"),
    "C3" => Cell.new("C3"),
    "C4" => Cell.new("C4"),
    "D1" => Cell.new("D1"),
    "D2" => Cell.new("D2"),
    "D3" => Cell.new("D3"),
    "D4" => Cell.new("D4")
  }
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinate)
    rows = coordinate.map { |row| row[0] }
    columns = coordinate.map { |column| column[1].to_i }
    # require "pry"; binding.pry
    if
      ship.length == coordinate.each_cons(coordinate.count)
    elsif
      ship.length == coordinate.count && (rows.uniq.concat.count == 1 && columns.each_cons(column))
    elsif
      ship.length == coordinate.count && (columns.uniq.concat.count == 1 && rows.each_cons(row))
    else
      false
    end
  end
end

#   def row(coordinate)
#     letters = coordinate.map { |letter| letter[0] }
#     row = letter.flatten
#   end
#
#   def column(coordinate)
#     numbers = coordinate.map { |number| number[1] }
#     column = number.flatten
#   end
# end
