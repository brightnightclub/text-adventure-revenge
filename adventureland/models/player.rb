class Player
  attr_accessor :location

  def initialize(room)
    self.location = room
  end

  def enter_portal(portal)
    self.location = portal.destination
  end
end

