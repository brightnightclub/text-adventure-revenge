
require_relative 'models/all'

def print_status(player)
  room = player.location
  puts "You are now in a #{room.name}"
  puts room.description + "\n\n"

  puts "You see: "
  room.portals.each do |portal|
    puts "a #{portal.name}"
  end
  puts ""
end

puts "WELCOME TO ADVENTURELAND"

world = World.new
player = world.player


ARGF.each do |line|
  player.location.portals.each do |portal|
    if line.strip == ''
      # do nothing
    elsif line.include?(portal.name)
      puts "\n#{portal.description}\n"
      player.enter_portal(portal)
    else
      puts "I didn't understand that\n"
    end
  end

  print_status(player)
  
end

