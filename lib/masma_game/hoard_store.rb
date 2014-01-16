module MasmaGame
Hoard = Struct.new(:name, :points)

module HoardStore
  HOARDS = [
    Hoard.new(:pie, 5),
    Hoard.new(:bottle, 25),
    Hoard.new(:hammer, 50),
    Hoard.new(:skillet, 100),
    Hoard.new(:broomstick, 200),
    Hoard.new(:crowbar, 400)
  ]
  
  def self.random
    HOARDS.sample
  end
end
end

if __FILE__ ==$0
puts HoardStore::HOARDS
hoard = MasmaGame::HoardStore.random
puts "Enjoy your #{hoard.points} point of #{hoard.name}"

end