require_relative 'auditable'

module MasmaGame
class Die
  include Auditable
  attr_reader :number
  
  def initialize
    roll
  end
  
  def roll
   @number =  rand(1..6)
  end
end
end
if __FILE__ == $0
  die = MasmaGame::Die.new
  puts die.roll
  puts die.roll
  puts die.roll
end