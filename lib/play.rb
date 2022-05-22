require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'

class Play

  def initialize
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  end


  def start

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
    puts "                            Enter p to play   "
    puts "                            Enter q to quit   "
    puts ""
    puts ""
    puts ""
    print">"
    user_input = gets.chomp.downcase
      if user_input == 'p'
        puts "Prepare for battle!!"
      elsif user_input == 'q'
        puts "Good Bye"
      else
        puts "What was that?"
      end


end
