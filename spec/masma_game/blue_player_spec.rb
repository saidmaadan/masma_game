require 'masma_game/blue_player'

module MasmaGame
describe BluePlayer do
  
  before do
    @player = BluePlayer.new("michel")
  end
  
  it "only gets half the point value for each hoard" do
    @player.points.should == 0

    hammer = Hoard.new(:hammer, 50)
    @player.found_hoard(hammer)
    @player.found_hoard(hammer)
    @player.found_hoard(hammer)

    @player.points.should == 75

    crowbar = Hoard.new(:crowbar, 400)
    @player.found_hoard(crowbar)
    
    @player.points.should == 275    
    
    yielded = []
    @player.each_found_hoard do |hoard|
      yielded << hoard
    end

    yielded.should == [Hoard.new(:hammer, 75), Hoard.new(:crowbar, 200)]    
  end
end
end