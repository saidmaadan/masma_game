require_relative 'player'
#require_relative 'treasure_trove'

module MasmaGame
class BluePlayer < Player
  def found_hoard(hoard)
    damaged_hoard = Hoard.new(hoard.name, hoard.points / 2.0)
    super(damaged_hoard)
  end
  
  # def found_hoard(hoard)
  #   points = hoard.points / 2
  #   @found_hoards[hoard.name] += points
  #   puts "#{@name} found a #{hoard.name} worth #{points} points."
  # end
end
end

if __FILE__ == $0
  blue = MasmaGame::BluePlayer.new("michel")  
  hammer = MasmaGame::Hoard.new(:hammer, 50)
  blue.found_hoard(hammer)
  blue.found_hoard(hammer)
  blue.found_hoard(hammer)
  crowbar = MasmaGame::Hoard.new(:crowbar, 400)
  blue.found_hoard(crowbar)
  blue.each_found_hoard do |hoard|
    puts "#{hoard.points} total #{hoard.name} points"
  end
  puts "#{blue.points} grand total points"
end