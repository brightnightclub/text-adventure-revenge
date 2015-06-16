Dir["./lib/*.rb"].each {|file| require file }
require 'thor'
require 'highline'

class Game < Thor
  desc "play", "Play the game."
  attr_accessor :world

  def play
    puts "\nPlease make your way to the emergency spacesuit.
          Located in.... located in..... <fades>....
          EMERGENCY POWER MODE ACTIVATED: LEVEL 6.\n\n"
    # system "say Please make your way to the emergency spacesuit Located in"
    # sleep 1
    # system "say located in"
    # sleep 2
    # system "say EMERGENCY POWER MODE ACTIVATED: LEVEL 6."

    @world = World.new
    first_move = true

    puts "\nYou are surrounded on all sides by airlocks.
    Please choose a direction.  Valid directions are:
      up, down, left, right, back, forward"

    loop do
      if world.win?
        puts "You find the space suit and escape to safety...?"
        break
      end

      if !world.player_alive?
        puts "You open the airlock and are immediately sucked into the vacuum of space. You are dead."
        break
      end

      if !first_move
        (world.distance_from_suit).times do
          sleep 0.09
          puts 7.chr
        end
        puts "You enter a room identical to the previous room; airlocks on all sides."
      end


      direction = ask "Enter direction: "

      if !['up', 'down', 'left', 'right', 'back', 'forward'].include?(direction)
        puts "#{direction} is not valid. Enter: 'up', 'down', 'left', 'right', 'back', or 'forward'."
        next
      end
      first_move = false
      world.move_player(direction)
    end
  end

end

Game.start(ARGV)
