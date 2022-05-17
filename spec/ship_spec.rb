require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  it 'is an instance of Ship' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
  end

  it 'is a type' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it 'has sunk?' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to be false
  end

  xit 'has been hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end
end
