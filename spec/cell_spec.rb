require 'rspec'
require './lib/cell'
require './lib/ship'
require 'pry'

RSpec.describe Cell do
  it 'is an instance of cell' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of Cell
  end

  it "contains a cell" do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it "cell is empty" do
    cell = Cell.new("B4")

    expect(cell.ship).to be_nil
  end

  it "does cell return empty?" do
    cell = Cell.new("B4")

    expect(cell.empty?).to be true
  end

  it "a ship exists" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    expect(cruiser).to be_instance_of Ship
  end

  it "places a ship" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)

    expect(cell.ship).to be_instance_of Ship
  end

  it "cell no longer empty" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)

    expect(cell.empty?).to be false
  end

  it "has ship been fired upon?" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to be false
  end

  it "fired upon ship" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
  end

  it "ship has been fired upon" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.fired_upon?).to be true
  end

  it "cell 1 is instance of Cell" do
    cell_1 = Cell.new("B4")

    expect(cell_1).to be_instance_of Cell
  end

  it "render empty cell" do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it "fire a shot and miss" do
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")

    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  it "cell_2 exist" do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")

    expect(cell_2).to be_instance_of Cell
  end

  it "cell_2 before render" do
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
  end

  it "show ship with render" do
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)

    expect(cell_2.render(true)).to eq("S")
  end

  it "fire upon and show hit" do
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expect(cell_2.render).to eq ("H")
  end


  it "is ship sunk?" do
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit

    expect(cruiser.sunk?).to be false
  end

  it "ship is sunk" do
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    cruiser.hit
    cruiser.hit
    cruiser.hit
  #may be revisiting
    expect(cruiser.sunk?).to be true
  end

  xit "ship is sunk" do
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    cruiser.hit
    cruiser.hit
    cruiser.hit
  #may be revisiting
    expect(cell_2.render).to eq("X")
  end


end
