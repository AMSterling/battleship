# require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'



class Play
  attr_reader

  def initialize
    @computer_board = nil
    @player_board = nil
    @computer_ship_1 = nil
    @computer_ship_2 =  nil
    @player_ship_1 = nil
    @player_ship_2 =  nil
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
    puts "                            Enter 'p' to play   "
    puts "                            Enter 'q' to quit   "
    puts ""
    puts ""
    puts ""

    print "> "
    player_input = gets.chomp.downcase

    if player_input == "q"
      puts "~~~~~~~~~~"
      puts "Goodbye!!!"
      puts "~~~~~~~~~~"
      exit
    elsif player_input == "p"
      puts "~~~~~~~~~~~~~~~~~~~"
      puts "PREPARE FOR BATTLE!"
      puts "~~~~~~~~~~~~~~~~~~~"
    end

      @computer_board = Board.new
      @player_board = Board.new
      @computer_ship_1 = Ship.new("Submarine", 2)
      @computer_ship_2 =  Ship.new("Cruiser", 3)
      @player_ship_1 = Ship.new("Submarine", 2)
      @player_ship_2 =  Ship.new("Cruiser", 3)
      @computer_sub = [
         ["A2", "A3"], ["A3", "A4"]
      ]
      @computer_cruiser = [
        ["A1", "B1", "C1"], ["B1", "B2", "B3"], ["B2", "B3", "B4"],
        ["B1", "C1", "D1"], ["B2", "C2", "D2"], ["B3", "C3", "D3"],
        ["C2", "C3", "C4"], ["B4", "C4", "D4"], ["C1", "C2", "C3"],
        ["D1", "D2", "D3"], ["D2", "D3", "D4"]
      ]

      @computer_board.place(@computer_ship_1, @computer_sub.sample)
      @computer_board.place(@computer_ship_2, @computer_cruiser.sample)


      puts "~I have laid out my ships!~"
      puts "You now need to place your 2 ships.."
      puts "The #{@player_ship_1.name} is #{@player_ship_1.length} units long and the #{@player_ship_2.name} is #{@player_ship_2.length} units long."

      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
      puts "========================================"

      puts "Select 2 coordinates for your #{@player_ship_1.name}."
      puts "Type your first coordinate (ex: A1) press 'enter' then type your second coordinate and press 'enter'."

      sub_array = []
        loop do
          print "> "
            sub_placement = gets.chomp.upcase.to_s
              if !@player_board.cells.keys.include?(sub_placement)
                puts "Seriously? C'mon meow."
                puts "Pick coordinate #{sub_array.count + 1}"
                redo
              else
                sub_array << sub_placement
                  if sub_array.count == 2 && @player_board.valid_placement?(@player_ship_1, sub_array)
                    break
                  else
                    sub_array.delete_at(1)
                    puts "Pick coordinate #{sub_array.count + 1}."
                    redo
                  end
              end
          end

      if
        @player_board.valid_placement?(@player_ship_1, sub_array)
          @player_board.place(@player_ship_1, sub_array)

      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
      puts "========================================"

      puts "Now select #{@player_ship_2.length} available coordinates for your #{@player_ship_2.name}."
      puts "Remember to type each coordinate on a new line!"

      cruiser_array = []
        until cruiser_array.count == 3 && @player_board.valid_placement?(@player_ship_2, cruiser_array)
          print "> "
            cruiser_placement = gets.chomp.upcase.to_s
              if !@player_board.cells.keys.include?(cruiser_placement)
                puts "Are we even looking at the same board?! Try again."
                puts "Select coordinate #{cruiser_array.count + 1}."
              elsif sub_array.include?(cruiser_placement)
                puts "Ships cannot overlap. Shame on you for trying."
                puts "Select coordinate #{cruiser_array.count + 1}."
              else
                cruiser_array << cruiser_placement
              end
          end
        end

        if
          @player_board.valid_placement?(@player_ship_2, cruiser_array)
            @player_board.place(@player_ship_2, cruiser_array)

      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "All boards ready! LET THE BATTLE COMMENCE!!!"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

      puts "=============COMPUTER BOARD============="
      puts   @computer_board.render


      puts "==============PLAYER BOARD=============="
      puts   @player_board.render(true)

      puts "========================================"

      until
        @computer_ship_1.sunk? == true && @computer_ship_2.sunk? == true ||
          @player_ship_1.sunk? == true && @player_ship_2.sunk? == true

      puts "~~~~~~~~~~"
      puts "YOUR TURN!"
      puts "~~~~~~~~~~"
      puts "Enter a coordinate to take your shot."
      print "> "

        player_shot = gets.chomp.upcase.to_s
          until @computer_board.valid_coordinate?(player_shot) == true
            puts "Try a valid coordinate this time!"
            print "> "
            player_shot = gets.chomp.upcase.to_s
          end

      computer_cell = @computer_board.cells[player_shot]
      computer_cell.fire_upon

        if @computer_board.cells[player_shot].render == "H"
          puts "~~~~~~~~~~~~~~~~~~"
          puts "You scored a HIT!!"
          puts "~~~~~~~~~~~~~~~~~~"
        elsif @computer_board.cells[player_shot].render == "M"
          puts "~~~~~~~~~~~~~~~~~"
          puts "HaHa You MISSED!!"
          puts "~~~~~~~~~~~~~~~~~"
        elsif @computer_board.cells[player_shot].render == "X"
          puts "~~~~~~~~~~~~~~~~~~"
          puts "You SUNK my ship!!"
          puts "~~~~~~~~~~~~~~~~~~"
        end

        puts "=============COMPUTER BOARD============="
        puts   @computer_board.render

        puts "==============PLAYER BOARD=============="
        puts   @player_board.render(true)

        puts "========================================"

      computer_shot = @player_board.cells.keys.sample(1).join
      player_cell = @player_board.cells[computer_shot]
      player_cell.fire_upon

        if @player_board.cells[computer_shot].render == "H"
          puts "~~~~~~~~~~~~~~~~~~~~~~~~"
          puts "Muahaha I SCORED A HIT!!" #Printing for misses
          puts "~~~~~~~~~~~~~~~~~~~~~~~~"
        elsif @player_board.cells[computer_shot].render == "M"
          puts "~~~~~~~~~~~~~~~"
          puts "DANG I MISSED!!"
          puts "~~~~~~~~~~~~~~~"
        elsif @player_board.cells[computer_shot].render == "X"
          puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
          puts "I HAVE YOU NOW HAHA...I SUNK YOUR SHIP!!"
          puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        end


      puts "=============COMPUTER BOARD============="
      puts   @computer_board.render

      puts "==============PLAYER BOARD=============="
      puts   @player_board.render(true)

      puts "========================================"
    end #for until

      if @computer_ship_1.sunk? == true && @computer_ship_2.sunk? == true

        puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "GAME OVER, YOU HAVE WON!!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Press 'p' to play again or 'q' to quit"
        print "> "
        player_input = gets.chomp.downcase
        if player_input == "p"
          Play.new.start
        elsif player_input == "q"
          puts "~~~~~~~~~~"
          puts "Goodbye!!!"
          puts "~~~~~~~~~~"
        else
          puts "~~~~~~~~~~~~"
          puts "Start Over!!"
          puts "~~~~~~~~~~~~"
        end

      else @player_ship_1.sunk? == true && @player_ship_2.sunk? == true

        puts "~~~~~~~~~~"
        puts "YOU LOSE!!"
        puts "~~~~~~~~~~"
        puts "Press 'p' to play again or 'q' to quit"
        print "> "
        if player_input == "p"
          Play.new.start
        elsif player_input == "q"
          puts "~~~~~~~~~~"
          puts "Goodbye!!!"
          puts "~~~~~~~~~~"
        else
          puts "~~~~~~~~~~~~"
          puts "Start Over!!"
          puts "~~~~~~~~~~~~"
        end
      end

  end
  end

  end
Play.new.start
