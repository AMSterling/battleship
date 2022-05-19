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
    end

    it 'is a number of cells' do
      board = Board.new

      expect(board.cells.length).to eq(16)
    end

    it 'A1 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be true
    end

    it 'D4 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("D4")).to be true
    end

    it 'A5 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A5")).to be false
    end

    it 'E1 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("E1")).to be false
    end

    it 'A22 is a valid coordinate' do
      board = Board.new

      expect(board.valid_coordinate?("A22")).to be false
    end



  end
