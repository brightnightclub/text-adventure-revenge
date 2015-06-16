class World
  SIZE = 3

  attr_accessor :length, :width, :height, :cube, :player, :suit

  def initialize
    @length = SIZE
    @width = SIZE
    @height = SIZE
    @cube = build_cube
    @player = Player.new(rand(3),rand(3),rand(3))
    @suit = Suit.new(rand(3),rand(3),rand(3))
  end

  def build_cube
    room_builder = -> { Array.new(length, Array.new(width, Array.new(height, Room.new))) }
    room_builder.call
  end

  def player_position
    player.position
  end

  def suit_position
    suit.position
  end

  def win?
    return player_position[:x] == suit_position[:x] && player_position[:y] == suit_position[:y] && player_position[:z] == suit_position[:z]
  end

  def player_alive?
    x = player.position[:x]
    y = player.position[:y]
    z = player.position[:z]

    if x > SIZE || x < 0
      return false
    elsif y > SIZE || y < 0
      return false
    elsif z > SIZE || z < 0
      return false
    else
      return true
    end
  end

  def move_player(direction)
    if direction == "back"
      player.position[:x] -= 1
    elsif direction == "forward"
      player.position[:x] += 1
    elsif direction == "right"
      player.position[:y] -= 1
    elsif direction == "left"
      player.position[:y] += 1
    elsif direction == "down"
      player.position[:z] -= 1
    elsif direction == "up"
      player.position[:z] += 1
    end
  end

  def distance_from_suit
    (player_position[:x] - suit_position[:x]).abs + (player_position[:y] - suit_position[:y]).abs + (player_position[:z] - suit_position[:z]).abs
  end
end
