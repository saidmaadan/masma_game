require_relative 'hoard_store'
require_relative 'playable'

module MasmaGame
class Player
  include Playable
  attr_accessor :name, :health
  
  def initialize(name, health=0)
    @name = name.capitalize
    @health = health
    @found_hoards = Hash.new(0)    
  end
  
  def found_hoard(hoard)
    @found_hoards[hoard.name] += hoard.points
    puts "#{@name} found a #{hoard.name} worth #{hoard.points} points."
    puts "#{@name}'s hoards: #{@found_hoards}"
  end
  
  def points
    @found_hoards.values.reduce(0, :+)
  end
  
  def each_found_hoard
    @found_hoards.each do |name, points|
      next_hoard = Hoard.new(name, points)
      yield next_hoard
    end
  end
  
  def score
    @health + points
  end
  
  def <=>(other)
      other.score <=> score
    end
  
  def to_s
    
    "I'm #{@name} with health = #{@health}, points = #{points} and score = #{score}"
  end
  
  def self.from_csv(string)
    name, health = string.split(',')    
    new(name, Integer(health))
  end
end
end

if __FILE__ == $0

player1 = MasmaGame::Player.new("fola", 80)
player2 = MasmaGame::Player.new("morounkeji", 50)
player3 = MasmaGame::Player.new("bolaji", 70)

players = [player1, player2, player3]

puts "There are #{players.size} in this game"
players.each do |p|
  puts p
  puts "**********************"
end
players.each do |p|
  p.w00t
  p.blam
  puts p
end  
  puts "**********************"

players.each do |p| 
  puts p.name
  puts p.health
  
end

end
  
  
