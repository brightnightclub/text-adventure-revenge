require "mikube/dragon"

class Location
  attr_accessor :description
  attr_accessor :monster
  
  def initialize(description)
    @description = description
    if rand(1..5) == 5
      @monster = Dragon.new
    end
  end
end





