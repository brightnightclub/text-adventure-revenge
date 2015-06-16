$:.unshift './'

require 'mikube/game'

class Cli
  def initialize
    @game = Game.new
    @player = @game.players.first
  end
  
  def start
    loop do
      puts "You are standing #{@player.location.description}."
      puts "Your health is #{@player.health}"
      puts "What would you like to do?"
      puts
      command = gets.chomp
      puts "You said: #{command}"
      
      verb, noun = command.split
      
      if verb == 'quit'
        break
      elsif verb == 'move'
        @game.move(@player, noun)
      elsif verb == 'fight'
        @game.battle(@player)
      end
      
      if @player.health <= 0
        puts "you died"
        break
      end
      puts
    end
    puts "Goodbye!"
  end
end

Cli.new.start