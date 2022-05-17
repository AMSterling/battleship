require 'rspec'
require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  it 'is an instance of cell' do
    cell = Cell.new("B4")
    expect(cell).to be_instance_of(Cell)
  end

  it "contains a cell" do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end

  it "cell is empty" do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end

  it "does cell return empty?" do
    cell = Cell.new("B4")
    expect(cell.empty?).to be true
  end

  xit "a ship exists" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    expect(cruiser).to be_instance_of(Ship)
  end

  xit "places a ship" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(Ship)
  end

  xit "cell no longer empty" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    expect(cell.empty?).to be false
  end

end
