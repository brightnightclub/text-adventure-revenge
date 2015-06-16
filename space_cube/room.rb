class Room

  def initialize
    @sides = {back: Door.new, forward: Door.new, up: Door.new, down: Door.new, left: Door.new, right: Door.new}
  end

  
end
