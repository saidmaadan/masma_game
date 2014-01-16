require_relative 'auditable'

module MasmaGame
class LoadedDie
  include Auditable
  
  attr_reader :number
  
  def roll
    numbers = [1, 1, 2, 5, 6, 6]
    @number = numbers.sample
    audit
    @number
  end  
end
end

if __FILE__ == $0
  die = MasmaGame::LoadedDie.new
  puts die.roll
  puts die.roll
  puts die.roll
end