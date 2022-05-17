require 'rspec'
require './lib/cell'
require './lib/ship'

RSpec.describe Ship do
  it 'is an instance of cell' do
    cell = Cell.new("B4")
    expect(cell).to be_instance_of(Cell)
  end

  it "contains a cell" do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end

  

end
