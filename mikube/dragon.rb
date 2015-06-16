require "mikube/monstery"

class Dragon
  attr_reader :damage
  
  include Monstery
  def initialize
    @damage = 10
  end
end