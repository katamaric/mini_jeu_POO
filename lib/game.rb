class Game
  attr_accessor :human_player, :enemies

  def initialize(human_player)
    @human_player = HumanPlayer.new(human_player) 
    @enemies = [
      Player.new("Eren"),
      Player.new("Jumanji Blonde"),
      Player.new("Banana Man"),
      Player.new("Big Hamster")
    ]
  end


  def kill_player(enemy)
    enemies.delete(enemy)
  end


  def is_still_ongoing?
    human_player.life_points > 0 && !enemies.empty?
  end


  def show_players
    puts "******* STATUS UPDATE *******"
    puts "#{human_player.show_state}"
    if enemies.count == 1
      puts "There is #{enemies.count} enemy left."
    else 
      puts "There are #{enemies.count} enemies left."
    end
  end


  def menu
    print "\n"
    puts "What would you like to do?"
    print "\n"
    puts "6: Find a better weapon"
    puts "7: Try to find a health pack"
    puts "Attack an enemy:"


    enemies.each_with_index do |enemy, index|
      puts "#{enemy.show_state}"
      puts "Press #{index + 1} to attack #{enemy.name}."
      print "\n"
    end
  end


  def menu_choice(player_choice)

    player_choice = player_choice.to_i

    if player_choice == 6
      human_player.search_weapon
    elsif player_choice == 7
      human_player.search_health_pack
    elsif (1..5).include?(player_choice) && is_still_ongoing?
      target = enemies[player_choice - 1]
      human_player.attacks(target)
    else 
      puts "You didn't choose a valid option. You lost your turn. Next time, choose A, B, or an enemy target to continue."
      print "\n"
    end

    if target != nil && target.life_points <= 0
      kill_player(target)
      puts "#{target.name} has been removed from the enemies forces."
    else
      puts "Your enemies are after you!"
    end
  end


  def enemies_attack
    enemies.each do |enemy|
      if is_still_ongoing?
        enemy.attacks(human_player)
      end
    end
  end


  def endgame
    if human_player.life_points <= 0
      puts "The enemies have won."
    else
      puts "Congratulations #{human_player.name}, you've defeated the enemies and survived!"
    end
  end

end