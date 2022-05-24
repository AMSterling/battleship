# require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'


class Play
  attr_reader :computer_placement, :take_turn
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
      puts "You now need to place your 2 ships.."
      puts "The Submarine is 2 units long and the Cruiser is 3 units long."

      puts @player_board.render(true)

      puts "Select 2 coordinates for your Submarine."
      puts "Type your first coordinate (ex: A1) press 'enter' then type your second coordinate and press 'enter'."

      sub_array = []
        until sub_array.count == 2 && @player_board.valid_placement?(@player_ship_1, sub_array)
          print "> "
            sub_placement = gets.chomp.upcase.to_s
              if !@player_board.cells.keys.include?(sub_placement)
                puts "Seriously? C'mon meow."
                puts "Pick coordinate #{sub_array.count + 1} and make it a good one."
              elsif
                sub_array << sub_placement
              end
          end

      if
        @player_board.valid_placement?(@player_ship_1, sub_array)
          @player_board.place(@player_ship_1, sub_array)

      puts @player_board.render(true)

      puts "Now select 3 available coordinates for your Cruiser."
      puts "Remember to type each coordinate on a new line!"

      cruiser_array = []
        until cruiser_array.count == 3 && @player_board.valid_placement?(@player_ship_2, cruiser_array)
          print "> "
            cruiser_placement = gets.chomp.upcase.to_s
              if !@player_board.cells.keys.include?(cruiser_placement)
                puts "Are we even looking at the same board?! Try again."
                puts "Select coordinate #{cruiser_array.count + 1}"
              else
                cruiser_array << cruiser_placement
              end
          end

        if
          @player_board.valid_placement?(@player_ship_2, cruiser_array)
            @player_board.place(@player_ship_2, cruiser_array)

      puts "=============COMPUTER BOARD============="
      puts   @computer_board.render

      puts "==============PLAYER BOARD=============="
      puts   @player_board.render(true)

      #### - gameplay loop around here maybe
      puts "Enter a coordinate to take a shot:"

      print "> "
      player_shot = gets.chomp.upcase.to_s
        until @computer_board.valid_coordinate?(player_shot) == true
          puts "Try a valid coordinate this time!"
          print "> "
          player_shot = gets.chomp.upcase.to_s
        end

      computer_cell = @computer_board.cells[player_shot]
      computer_cell.fire_upon
      puts @computer_board.render

      puts "MY TURN!!"

      computer_shot = @player_board.cells.keys.sample(1).join
      player_cell = @player_board.cells[computer_shot]
      player_cell.fire_upon
      puts @player_board.render(true)

      puts "=============COMPUTER BOARD============="
      puts   @computer_board.render

      puts "==============PLAYER BOARD=============="
      puts   @player_board.render(true)


 ####Create gameplay loop until ships are sunk

      elsif player_input == "q"
        puts "Goodbye!!!"
      else
        puts "Start Over!!"
      end
    end
  end
end



# until @player_board.valid_coordinate?(computer_shot) == true
# end
# player_cell = @player_board.cells[computer_shot].fire_upon? == true
# require "pry"; binding.pry
#
#       # @player_board.valid_coordinate?(computer_shot)
# until @player_board.cells[computer_shot].fired_upon? == true
# # until @player_board.valid_coordinate?(computer_shot) == true
# #   computer_shot = @player_board.cells.keys.sample(1)
# # end
# #
# #
