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
end
