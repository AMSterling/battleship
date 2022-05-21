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
   if
    coordinate.length != ship.length
     false
   elsif
     overlap(coordinate)
     false
   elsif
    ascending_rows(coordinate) && ascending_columns(coordinate)
     false
   elsif
    descending_rows(coordinate) || descending_columns(coordinate)
     false
   elsif
    !ascending_rows(coordinate) && !same_rows(coordinate)
     false
   elsif
    !ascending_columns(coordinate) && !same_columns(coordinate)
     false
   elsif
    ascending_rows(coordinate) && same_columns(coordinate)
     true
   else
    ascending_columns(coordinate) && same_rows(coordinate)
     true
   end
 end

 def rows(coordinate)
   rows = coordinate.map { |row| row[0].ord }
 end

 def columns(coordinate)
   columns = coordinate.map { |column| column[1].to_i }
 end

 def same_rows(coordinate)
   rows(coordinate).uniq.concat.length == 1
 end

 def same_columns(coordinate)
   columns(coordinate).uniq.concat.length == 1
 end

 def ascending_rows(coordinate)
   rows = rows(coordinate)
    rows.first + rows.length - 1 == rows.last
 end

 def ascending_columns(coordinate)
   columns = columns(coordinate)
    columns.first + columns.length - 1 == columns.last
 end

 def descending_rows(coordinate)
   rows = rows(coordinate)
    rows.first - rows.length - 1 == rows.last
 end

 def descending_columns(coordinate)
   columns = columns(coordinate)
    columns.first - columns.length - 1 == columns.last
 end

 def place(ship, coordinate)
   if valid_placement?(ship, coordinate)
     coordinate.map { |cord| @cells[cord].place_ship(ship)}
   end
 end

 def overlap(coordinate)
   coordinate.any? {|cord| !@cells[cord].empty?}
 end

end
