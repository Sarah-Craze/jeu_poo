require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane", 10,) #Nom et point de vie
player2 = Player.new("José", 10) #Nom et point de vie

while player1.life_points > 0 && player2.life_points > 0

puts "Voici l'état de chaque joueur"
player1.show_state
player2.show_state

#Passons à la phase d'attaque
puts "Passons à la phase d'attaque :"
player1.attacks(player2)

    if player2.life_points <= 0
break

    else
        player2.attacks(player1)
    end
end

puts "Fin du combat"

#Humanclass
puts "Saisisez votre nom"
human_player_choose = gets.chomp
human_player1 = HumanPlayer.new(human_player_choose)
human_player1.search_weapon
human_player1.search_health_pack


binding.pry