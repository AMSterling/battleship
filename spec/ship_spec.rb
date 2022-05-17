require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  it 'is an instance of Ship' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of Ship
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

  it 'has been hit' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  it 'takes two hits' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(1)
  end

  it 'takes three hits' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(0)
  end

  it 'has been sunk?' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to be true
  end
end
