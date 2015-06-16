class Player

  attr_accessor :position, :alive

  def initialize(x,y,z)
    @position = {x: x,y: y,z: z}
    @alive = true
  end
end
