require 'mikube/player'
require 'mikube/location'

class Game
  attr_accessor :players
  
  def initialize
    @locations = {}
    @map = {}
    
    first_player = Player.new
    @players = [first_player]
    
    first_player.location = add_location([0,0], 'an open field')
  end
  
  def battle(player)
    if player.location.monster
      if rand(1..2) == 2
        puts "You killed #{player.location.monster.class}"
        player.location.monster = nil
      else
        puts "You missed!"
        player.health -= player.location.monster.damage
      end
    end
  end
  
  def add_location(coordinates, description)
    new_location = Location.new(description)
    @map[coordinates] = new_location
    @locations[new_location] = coordinates
    
    new_location
  end
  
  def say(words)
    do_it do
      puts "words"
    end
  end
  
  def do_it
    puts "I'm about to do it!"
    yield
    puts "I did it!"
  end
  
  def add_random_location(coordinates)
    descriptions = [
      'in a dark forest',
      'in a muddy bog',
      'in an arid desert',
      'below a waterfall',
      'at the mouth of a cave',
      'on the edge of a chasm',
      'on a cloud',
      'on a boat',
      'at the edge of eternity',
      'an icy tundra',
      'in the belly of a whale',
      'on a submarine',
      'in a castle'
      ]
    add_location(coordinates, descriptions.sample)
  end
  
  def player_coordinates(player)
    @locations[player.location]
  end
  
  def move(player, direction)
    x,y = player_coordinates(player)
    
    case direction
    when 'north'
      move_to_coordinates(player, [x,y+1])
    when 'east'
      move_to_coordinates(player, [x+1,y])
    when 'south'
      move_to_coordinates(player, [x,y-1])
    when 'west'
      move_to_coordinates(player, [x-1,y])
    end
  end
  
  def move_to_coordinates(player, new_coordinates)
    next_location = @map[new_coordinates]
      
    unless next_location
      add_random_location(new_coordinates)  
      next_location = @map[new_coordinates]
    end
      
   player.location = next_location
   player.location.monster.attack(player) if player.location.monster
  end
  
end

  
  
  
  
  
  
  
  
  
  