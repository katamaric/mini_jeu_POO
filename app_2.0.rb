require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "Welcome to the arena!"
puts "Your goal is to be the last one standing!"
print "\n"
print "⠀⠀⠀⠀⣠⣶⣶⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣶⣦⠀⠀
⠀⠀⠀⠀⢿⣿⣿⣿⠀⠀⠀⢀⣀⣠⣤⣄⠀⢿⣿⣿⣿⠇⠀
⠀⠀⠀⠀⠈⣉⣩⣥⣶⣶⣿⣿⣿⡿⠿⠋⣀⣀⣉⣉⡁⠀⠀
⠀⠀⣠⣾⣿⣿⣿⣿⡟⠛⠋⠉⠀⣠⣴⣿⣿⣿⣿⣿⣿⣧⠀
⣴⣾⣿⣿⣿⣿⣿⣿⢁⣤⣶⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀
⠻⠿⣿⣿⣿⣿⣿⠇⠈⠻⠟⠋⠉⠁⢰⣿⣿⣿⣿⣿⣿⡿⠂
⠀⢠⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡏⠀⠀⠀⠀
⠀⣸⣿⣿⠟⣿⣿⣧⠀⠀⠀⠀⣰⣿⣿⡿⣿⣿⣷⠀⠀⠀⠀
⠀⣿⣿⡟⠀⠘⣿⣿⡇⠀⠀⢰⣿⣿⠟⠀⠸⣿⣿⡄⠀⠀⠀
⣰⣿⣿⠃⠀⠀⣿⣿⡇⠀⠀⢸⣿⣿⠀⠀⠀⢿⣿⣧⠀⠀⠀
⣿⣿⠇⠀⠀⠀⣿⣿⡇⠀⠀⢸⣿⣿⠀⠀⠀⠘⣿⣿⡆⠀⠀
⠉⠉⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠈⠉⠀⠀⠀"
print "\n"

puts "What's your gladiator name?"
player_name = gets.chomp
player = HumanPlayer.new(player_name)

enemies = [] 
enemy_1 = Player.new("Z")
enemy_2 = Player.new("K")
enemies << enemy_1 
enemies << enemy_2

print "\n"
puts "These are your opponents: #{enemy_1.name} and #{enemy_2.name}."

while player.life_points > 0 && (enemy_1.life_points > 0 || enemy_2.life_points > 0)
  print "\n"
  puts "******* STATUS UPDATE *******"
  puts "#{player.show_state}"
  print "\n"
  puts "What would you like to do?"
  print "\n"
  puts "A: Find a better weapon"
  puts "B: Try to find a health pack"
  puts "Attack an enemy:"
  puts "#{enemy_1.show_state}"
  puts "Press 0 to attack #{enemy_1.name}."
  puts "#{enemy_2.show_state}"
  puts "Press 1 to attack #{enemy_2.name}."
  print "\n"
  player_choice = gets.chomp
  if player_choice == "A"
    player.search_weapon
  elsif player_choice == "B"
    player.search_health_pack
  elsif player_choice == "0"
    player.attacks(enemy_1)
  elsif player_choice == "1"
    player.attacks(enemy_2)
  else 
    puts "You didn't choose a valid option. You lost your turn. Next time, choose A, B, 0 or 1."
    print "\n"
  end
  break if (enemy_1.life_points <= 0 && enemy_2.life_points <= 0)
  puts "Your enemies are after you!"
  enemies.each do |enemy|
    if player.life_points > 0 && enemy.life_points > 0
      enemy.attacks(player)
    else
      "You have died."
    end
  end
end  

if player.life_points <= 0
  puts "You have died. The enemies have won."
else
  puts "Congratulations #{player.name}, you've defeated the enemies and survived!"
end