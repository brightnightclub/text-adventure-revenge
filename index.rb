require 'pry'

class Player
  include Comparable
  attr_writer :attack_score
  attr_accessor :name

  def initialize(attack_score)
    @attack_score = attack_score
  end

  def attack_score
    @attack_score# * (rand(10)+1)/10
  end

  def <=>(other)
    attack_score <=> other.attack_score
  end

  def attack
  end
end

class Enemy < Player
  NAMES = [
    'Slime',
    'Goblin',
    'Dwarf',
    'Baby Dragon',
    'Wolf',
    'Elf',
    'Mamma Dragon',
    'Monster2',
    'Monster3',
    'Monster4'
  ]

  def initialize(attack_score)
    @name = NAMES[attack_score]
    super
  end

  def to_s
    "Yarr! I'm a #{@name}!"
  end
end

class Hero < Player
  def initialize
    @name = 'Hero!'
    super(4)
  end
end

class Board
  def initialize
    @hero = Hero.new
    @enemies = 7.times.map do |i|
      Enemy.new(i)
    end
  end

  def victory?(enemy)
    while true

      puts "What would you like to do? [fight, run]"
      case gets.chomp
      when 'fight'
        puts "you are fighting."
        return @hero > enemy
      when 'run'
        puts "you are running"
        return true
      else
        puts "What? That was not a valid action. Try again!"
      end
    end
  end

  def play
    system 'clear'
    puts "TEXT ADVENTURE!"

    while enemy = @enemies.shift
      puts "You run into a new scary room.  In the darkness, something yells #{enemy}"
      if victory?(enemy)
        puts "You lived. Press enter key to continue."
        gets
        system 'clear'
      else
        puts "you just died. lol"
        return false
      end
    end
  end
end

Board.new.play
