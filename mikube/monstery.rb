module Monstery
  def attack(player)
    player.health -= @damage
    puts
    puts "*"*80
    puts "You were attacked by #{self.class}"
    puts "*"*80
  end
end