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

  def computer_placement #Maybe?
    ship.length.times do { place(ship, coordinate).sample }
    until valid_coordinate?(coordinate) == valid_placement(ship, coordinate)
    end
  end
  end

  def render(rend = false)
    if @ship != nil
      render_board_1 = "  1 2 3 4 \n" +
      "A #{@cell["A1"].render(rend)} #{@cells["A2"].render(rend)} #{@cells["A3"].render(rend)} #{@cells["A4"].render(rend)} \n" +
      "B #{@cells["B1"].render(rend)} #{@cells["B2"].render(rend)} #{@cells["B3"].render(rend)} #{@cells["B4"].render(rend)} \n" +
      "C #{@cells["C1"].render(rend)} #{@cells["C2"].render(rend)} #{@cells["C3"].render(rend)} #{@cells["C4"].render(rend)} \n" +
      "D #{@cells["D1"].render(rend)} #{@cells["D2"].render(rend)} #{@cells["D3"].render(rend)} #{@cells["D4"].render(rend)} \n"
      return render_board_1
    else rend == true
      render_board_2 = "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
      return render_board_2
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
