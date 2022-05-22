

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
player_input = $stdin.gets.chomp.downcase

if player_input == "p"
 puts "Let's Play!!"
 play.start
elsif player_input == "q"
 puts "Goodbye!!!"
else
 puts "Goodbye!!"
end
