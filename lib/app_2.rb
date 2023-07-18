require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " ------------------------------------------------ "
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "Quel est votre nom 1er combattant"
name = gets.chomp
human_player= HumanPlayer.new(name)

player0 = Player.new("0 - Josiane", 10) 
player1 = Player.new("1 - José", 10)
enemies = [player0, player1]


while human_player.life_points >0 && (player0.life_points > 0 || player1.life_points >0)

    puts "===== Tour de jeu ====="
    puts human_player.show_state
  
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"


    enemies.each do |enemies|
        enemies.show_state
    end
    puts "Saisir votre choix"
    choix = gets.chomp.downcase
  
    case choix
    when "a"
      human_player.search_weapon
    when "s"
      human_player.search_health_pack
    when "0"
      human_player.attacks(player0)
    when "1"
      human_player.attacks(player1)
        puts "les autres joueurs t'attaquent"
    
    enemies.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(human_player)
      end
    end
  end

  puts "Le jeu est terminé !"
    if human_player.life_points > 0 
        puts "Dommage, tu as perdu !"
    else
        puts "Yes ! ta gagner"
    end
end





binding.pry