require 'masma_game/red_player'

module MasmaGame
describe RedPlayer do
  
  before do
    @initial_health = 50 
    @player = RedPlayer.new("red_army", @initial_health)
  end
  
  it "does not go red when w00ted up to 5 times" do
    1.upto(5) { @player.w00t }
    
    @player.red?.should be_false
  end
  
  it "goes red when w00ted more than 5 times" do
    1.upto(6) { @player.w00t }
    
    @player.red?.should be_true
  end
  
  it "gets w00ted instead of blammed when it's gone red" do  
    1.upto(6) { @player.w00t }
    1.upto(2) { @player.blam }
    
    @player.health.should == @initial_health + (8 * 15)
  end
end
end