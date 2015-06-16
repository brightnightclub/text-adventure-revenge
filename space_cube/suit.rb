class Suit
  attr_accessor :position

  def initialize(x,y,z)
    @position = {x: x,y: y,z: z}
  end
end
