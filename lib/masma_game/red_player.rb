require_relative 'player'

module MasmaGame
class RedPlayer < Player
  def initialize(name, health=100)
    super(name, health)
    @w00t_count = 0
  end
  
  def red?
    @w00t_count > 5
  end
  
  def w00t
    super
    @w00t_count +=1
    puts "#{@name} is Red Army!" if red?
  end
  
  def blam
    if red?
      w00t
    else
      super
    end
    
    # or use the ternary operator:
    # red? ? w00t : super
  end
end
end

if __FILE__ == $0
  red = MasmaGame::RedPlayer.new("red", 50)
  6.times { red.w00t }
  2.times { red.blam }
  puts red.health
end