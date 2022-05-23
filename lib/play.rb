# require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'


class Play
  attr_reader :computer_placement
  def initialize
    @board = Board.new
    @computer_board = Board.new
    @computer_ship = ships
    @player_board = Board.new
    @player_ships = ships
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  end


    puts ""
    puts ""
    puts ""
    puts "   WELCOME TO"
    puts "    "
    puts "    =====  =====  ====  ====  ==    =====   =====   == ==   ====   ===== "
    puts "    || ||  |/ ||   ||    ||   ||    || _    || _    || ||    ||    || || "
    puts "    x===x  x===x   ||    ||   ||    || -       ||   ||_||    ||    x===x "
    puts "    || ||  || ||   ||    ||   ||    ||         ||   ||-||    ||    ||    "
    puts "    |l_/|  || ||   ||    ||   |l__  |l__    __/ /   || ||    ||    ||    "
    puts "    =====  == ==   ==    ==   ===== =====  l===/    == ==   ====   ==    "
    puts "                                              "
    puts "                                   _/         "
    puts "                               ||_//_/|/      "
    puts "                               ||-----|/      "
    puts "                               ||  =  |/      "
    puts "                               _/_____|/      "
    puts "                              _/l-----/-/     "
    puts "                                || || ||      "
    puts "                                || /  /|      "
    puts "                                //  _//       "
    puts "                               /              "
    puts "                                              "
    puts "                            Enter 'p' to play   "
    puts "                            Enter 'q' to quit   "
    puts ""
    puts ""
    puts ""

    print "> "
    player_input = gets.chomp.downcase

    if player_input == "p"
      puts "Prepare for battle!"
      @computer_board = Board.new
      # coordinates = []
      # until @computer_board.valid_placement?(@computer_ship_1, @computer_board.cells.keys) == true do
      #   corrdinates = @computer_board.place(@computer_ship_1, @computer_board.cells.keys.sample(2))
      # end
      # puts coordinates


    elsif player_input == "q"
     puts "Goodbye!!!"
    else
     puts "Could you repeat that?"
    end

    def ships
      ships = [["Cruiser", 3], ["Submarine", 2]]
    end
end
