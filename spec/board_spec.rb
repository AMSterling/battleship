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

    xit 'A1 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be true
    end

    xit 'D4 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("D4")).to be true
    end

    xit 'A5 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A5")).to be false
    end

    xit 'E1 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("E1")).to be false
    end

    xit 'A22 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A22")).to be false
    end



  end
