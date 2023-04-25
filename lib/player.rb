class Player
	attr_accessor :name, :life_points
 
  
	def initialize(name_to_save, life_points_to_save = 10)
		@name = name_to_save
		@life_points = life_points_to_save
	end


	def show_state
    if @life_points <= 0
      puts "#{@name} has no more life points. They have perished."
    else
		  puts "#{@name} has #{@life_points} life points. Stay strong."
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
		puts "#{@name} inflicts #{damage_inflicted} points of damage to #{player2.name}"
    player2.life_points -= damage_inflicted

		if player2.life_points <= 0
      puts "#{player2.name} has been eliminated!"
    end
	end

end