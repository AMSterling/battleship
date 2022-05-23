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


  def render(render = false)
    if render == false
      return "  1 2 3 4 \n" +
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
      "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    elsif render == true
      return "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    # elsif rend == true && @fire_upon
    #   render_board_4 = "  1 2 3 4 \n" +
    #   "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
    #   "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
    #   "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
    #   "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    #   return render_board_4
    end
  end
end
