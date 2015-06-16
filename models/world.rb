class World
  attr_accessor :levels
  attr_accessor :player

  def initialize
    level = Level.new

    foyer  = Room.new(name: 'The Foyer', description: 'It is quite elegant')
    living = Room.new(name: 'The Living Room', description: 'You are feeling very hungry')
    dining = Room.new(name: 'The Dining Room', description: 'Finally, food!')

    foyer.portals << Portal.new(destination: living, name: 'A strong door')
    living.portals << Portal.new(destination: dining, name: 'A delicious-smelling archway')

    level.rooms += [foyer, living, dining]

    self.levels = [level]
    self.player = Player.new(level.rooms.first)
  end
end
