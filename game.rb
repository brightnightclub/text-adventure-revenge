
require_relative 'models/all'

puts "WELCOME TO ADVENTURELAND"

world = World.new
player = world.player


ARGF.each do |line|
  location = player.location
  puts "You are currently in #{location.name}"
  puts location.description
end

