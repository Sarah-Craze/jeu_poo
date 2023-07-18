require "pry"
class Player

    attr_accessor :name, :life_points

    def initialize(name_to_save, life_points_to_save)
        @name = name_to_save
        @life_points = life_points_to_save
       
    end
    
    def life_points 
        @life_points
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie."
    end

    def compute_damage
        return rand(1..6)
    end

    def gets_damage(damage_received) #Attente d'argument a saisir
        @life_points -= damage_received #cette argument n'est pas comptabilisé a saisir
        if @life_points <= 0
            puts "le joueur #{@name} a été tué !"
        end
    end

    def attacks(other_player)
        damage = compute_damage
        puts "Le joueur #{@name} attaque #{other_player.name}"
        puts "Il lui inflige #{damage} points de dommages."
        other_player.gets_damage(damage)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    
    def initialize(player_name)   
        @name = player_name
        @life_points = 100
        @weapon_level = 1

    end


    def compute_damage
        rand(1..6) * @weapon_level
      end
    
      def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}."
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts " Tu as trouvé une arme de niveau #{new_weapon_level}"
         if new_weapon_level > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
            @weapon_level = new_weapon_level
        else 
            puts "Damned... elle n'est pas mieux que ton arme actuelle..."
        end
     end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
        puts "Tu n'as rien trouvé..."
        elsif health_pack == 6
        @life_points += 80
        @life_points = 100 if @life_points > 100
        puts " Waow, tu as trouvé un pack de +80 points de vie"
        else
        @life_points += 50
        @life_points = 100 if @life_points > 100
        puts " Bravo, tu as trouvé un pack de +50 points de vie !"
        end
    end 

end

