require_relative 'die'
require_relative 'player'
require_relative 'hoard_store'
require_relative 'loaded_die'

module MasmaGame
module NextGame
  
  def self.next_player(p)
    die = Die.new
     case die.roll
      when 1..2
      p.blam          
      when 3..4
      puts "#{p.name} was skipped."
     else
      p.w00t    
     end
    
    hoard = HoardStore.random
    p.found_hoard(hoard)
    
  end
end
end

if __FILE__ == $0
  p = MasmaGame::Player.new("bimbo", 125)
  MasmaGame::NextGame.next_player(p)
end


