class Player
	attr_accessor :name, :life_points
 
  
	def initialize(name_to_save, life_points_to_save = 10)
		@name = name_to_save
		@life_points = life_points_to_save
	end


	def show_state
    if @life_points <= 0
      return "#{@name} has no more life points. They have perished."
    else
		  return "#{@name} has #{@life_points} life points. Stay strong."
    end
	end


	def gets_damage(ouch)
		@life_points -= ouch 

		if @life_points <= 0
			puts "#{@name} is dead.."
		else 
			puts "#{@name} has #{@life_points}."
		end
  end


  def compute_damage
    return rand(1..6)
  end


	def attacks(player2)
		puts "#{@name} attacks #{player2.name}."
		
    damage_inflicted = compute_damage
		puts "#{@name} inflicts #{damage_inflicted} points of damage to #{player2.name}."
    player2.life_points -= damage_inflicted

		if player2.life_points <= 0
      print "\n"
      puts "#{player2.name} has been eliminated!"
    end
	end

end


class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name_to_save, life_points_to_save = 100, weapon_level_to_save = 1)
		@life_points = life_points_to_save
		@weapon_level = weapon_level_to_save

		super(name_to_save, life_points_to_save)
	end


	def compute_damage
		return rand(1..6) * @weapon_level
	end


  def search_weapon
    weapon_found = rand(1..6)
    puts "You've found a level #{weapon_found} weapon!"

    if weapon_found > @weapon_level
      @weapon_level = weapon_found
      puts "Nice! It's better than your current weapon. Let's take it."
    else weapon_found <= @weapon_level
      puts "C'est pas ouf.. Let's not."
    end
  end


  def search_health_pack
    health_pack_found = rand(1..6)

    if health_pack_found == 1
      puts "Aw :-( You didn't find anything. Sorry. Better luck next time."
    elsif (2...5).include?(health_pack_found)
			@life_points += 50 
      puts "Congratulations! You found a 50HP health pack. Your health has replenished."
    else
      @life_points += 80
      puts "It's your lucky day! You found a 80HP health pack. Your health has replenished exponentially. Go get 'em."
    end

    @life_points = 100 if @life_points > 100
  end

end