require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

  RSpec.describe Board do
    it 'is initializes the Board' do
      board = Board.new

      expect(board).to be_instance_of Board
    end

    it 'has a collection of cells' do
      board = Board.new

      expect(board.cells).to be_instance_of(Hash)
      expect(board.cells.length).to eq(16)
    end
  end
