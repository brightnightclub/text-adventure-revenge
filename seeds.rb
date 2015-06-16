level = Level.new
rooms = Array.new(6){Room.new}


rooms[0].name = "outside the castle gates"
rooms[0].description = "You stand in front of a grand old gateway attached an old ass castle which looms loomingly above you. The mists close behind you, limiting your visibility to a few meters. A howl wolves in the distance."
rooms[0].portals = [
  Portal.new(destination: rooms[1]),
  Portal.new(destination: rooms[2])
]

rooms[1].name = "the grand entrance hall"
rooms[1].description = "Before you, you see a windy staircase (the top of which you cannot see) and a door to your left that looks like it leads to a dungeon (due to the bloody corpse sitting infront of it that happens to be grasping a dirty old sponge) "
# rooms[1].items = [
#   Item.new(name: "dirty old sponge"),
#   Item.new(name: "flowers in a shiny vase")
# ]
rooms[1].portals = [
  Portal.new(destination: rooms[3]),
  Portal.new(destination: rooms[4])
]

rooms[2].name = "the gate to the castle grounds"
rooms[2].description = "You have stumbled your way to the exit from the dreary castle grounds. The gates are open to the south, and you can make out the path back to the castle entrance to the north. You swear you can hear the wind whispering 'cowaaaaaaard' across your ears."
rooms[2].portals = [
  Portal.new(destination: rooms[0]),
  Portal.new(destination: rooms[5])
]

rooms[3].name = "up into the tallest tower"
rooms[3].description = "Turns out you have to play the Old Cowboy in Russian Roulette before you can learn the secret to your destiny and rescue the Princess. What a bummer! The good news is that your sanity is so low that you accept."
rooms[3].portals = [
  Portal.new(destination: rooms[1]),
  Portal.new(destination: rooms[2])
]

rooms[4].name = "dungeon"
rooms[4].description = "Seriously?! You went into the dungeon with the bloody corpse outside of it?! You lose! You lost so badly! Are you surprised?? Why?? What's wrong with you?"
rooms[4].portals = [
  Portal.new(destination: rooms[1]),
  Portal.new(destination: rooms[2])
]

rooms[5].description = "u won, coward"


level.rooms = rooms
World.get.level = level
