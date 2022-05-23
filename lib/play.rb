# require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'


class Play
  attr_reader :computer_placement
  def initialize
    @board = Board.new
    @computer_board = Board.new
    @player_board = Board.new
    @computer_ship_1 = Ship.new("Submarine", 2)
    @computer_ship_2 =  Ship.new("Cruiser", 3)
    @player_ship_1 = Ship.new("Submarine", 2)
    @player_ship_2 =  Ship.new("Cruiser", 3)
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
      @player_board = Board.new
      @computer_ship_1 = Ship.new("Submarine", 2)
      @computer_ship_2 =  Ship.new("Cruiser", 3)
      @player_ship_1 = Ship.new("Submarine", 2)
      @player_ship_2 =  Ship.new("Cruiser", 3)

      if @computer_board.valid_placement?(@computer_ship_1, ["D2", "D3"])
        @computer_board.place(@computer_ship_1, ["D2", "D3"])

        @computer_board.valid_placement?(@computer_ship_2, ["B4", "C4", "D4"])
          @computer_board.place(@computer_ship_2, ["B4", "C4", "D4"])
      end

      puts "I have laid out my ships!"
      puts "You now need to lay out your 2 ships"
      puts "The Submarine is 2 units long and the Cruiser is 3 units long."
      puts @player_board.render(true)
      puts "Select 2 coordinates for your Submarine"
      puts "Type your first coordinate (ex: A1) press 'enter' then type your second coordinate and press 'enter' "
      print "> "
      sub_array = Array.new
        until sub_array.count == 2
          sub_array << gets.chomp.upcase.to_s
        end

      if !@player_board.valid_placement?(@player_ship_1, sub_array)
        puts "Invalid selection. Pick again"
      print "> "
      elsif
        @player_board.valid_placement?(@player_ship_1, sub_array)
        @player_board.place(@player_ship_1, sub_array)
      puts @player_board.render(true)
      puts "Now select 3 available coordinates for your Cruiser"
      puts "Type your first coordinate, press 'enter' then type your second coordinate, press 'enter'
      type in your third coordinate then press 'enter' "
      print "> "
      cruiser_array = Array.new
        until cruiser_array.count == 3
          cruiser_array << gets.chomp.upcase.to_s
        end
        if @player_board.valid_placement?(@player_ship_2, cruiser_array)
          @player_board.place(@player_ship_2, cruiser_array)
        puts @player_board.render(true)
        else
        puts "Invalid selection. Pick again"
        print "> "
        end
      end


    elsif player_input == "q"
     puts "Goodbye!!!"
    else
     puts "Could you repeat that?"
    end

   #  def take_turn
   # puts "=============COMPUTER BOARD============="
   # puts @computer_board.render
   #
   # puts "==============PLAYER BOARD=============="
   # puts @player_board.render(true)
   #
   # puts "Enter the coordinate to take a shot:"


    def ships
      ships = [["Cruiser", 3], ["Submarine", 2]]
    end
end
