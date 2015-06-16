require 'pry'
require 'colorize'

class Player
  include Comparable
  attr_accessor :attack_score
  attr_accessor :name

  def initialize(attack_score)
    @attack_score = attack_score
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
    'Unicorn Lion',
    'Fantasy Tiger',
    'Mean Bear'
  ]

  INTROS = [
    "Yarr!",
    "Hello there, friend!",
    "Fee Fi FO FUMMM!",
    "Something stinks!",
    "<Loud slobbering>",
    "GRRRRRRRRRR"
  ]

  def initialize(attack_score)
    @name = NAMES[attack_score]
    @intro = INTROS.sample
    super
  end

  def to_s
    "#{@intro} I'm a #{@name}!"
  end
end

class Hero < Player
  def initialize
    @name = 'Hero!'
    super(4)
  end

  def attack_score
    roll = rand(5) + 1
    value = @attack_score + roll
    slow_print "You rolled a #{roll}...", :blue
    value
  end
end

class Board
  def initialize
    @hero = Hero.new
    @enemies = (Enemy::NAMES.length).times.map do |i|
      Enemy.new(i)
    end
  end

  def victory?(enemy)
    while true

      slow_print "What would you like to do? [fight, run]", :blue
      case gets.chomp
      when 'fight'
        slow_print "you are fighting.", :blue
        return @hero > enemy
      when 'run'
        slow_print "you are running", :blue
        return true
      else
        slow_print "What? That was not a valid action. Try again!", :yellow
      end
    end
  end

  def play
    score = 0
    system 'clear'
    slow_print "TEXT ADVENTURE!", :light_red
    while enemy = @enemies.shift
      slow_print "You run into a new scary room.  In the darkness, something yells #{enemy}", :blue
      if victory?(enemy)
        score = score + 1
        slow_print "You lived. Press enter key to continue.", :green
        gets
        system 'clear'
      else
        slow_print "You died. Your final score was: #{score}.", :red
        return false
      end
    end
    slow_print "You won! Your final score was: #{score}.", :light_blue
  end
end

def slow_print(text, color = :black)
  text.each_char do |char|
    print char.colorize(color)
    sleep 0.025
  end
  print "\n"
end

Board.new.play
