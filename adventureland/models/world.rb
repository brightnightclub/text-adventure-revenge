class World
  attr_accessor :levels
  attr_accessor :player

  def initialize
    level = Level.new

    foyer  = Room.new(name: 'Foyer', description: 'It is quite elegant')
    living = Room.new(name: 'Living Room', description: 'You are feeling very hungry')
    dining = Room.new(name: 'Dining Room', description: 'Finally, food!')

    foyer.portals << Portal.new(destination: living, name: 'strong door', description: 'It heaves heavily')
    living.portals << Portal.new(destination: dining, name: 'delicious-smelling archway', description: 'Candlelight sparkles invitingly')

    level.rooms += [foyer, living, dining]

    self.levels = [level]
    self.player = Player.new(level.rooms.first)
  end

  # When you change the level, move the player to the first room of the new level
  def level=(level)
    self.level = level
    self.player.location = level.rooms.first
  end

  def self.get
    @world ||= World.new
  end
end
