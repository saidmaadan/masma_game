require 'masma_game/player'
require 'masma_game/hoard_store'

module MasmaGame
describe Player do
  before do
    @initial_health = 50
    @player = Player.new("bimbo", @initial_health)
  end
  
  it "has a capitalized name" do    
    @player.name.should == "Bimbo"
  end
  
  it "has an initial health" do  
    @player.health.should == 50
  end
  
  it "has a string representation" do    
    @player.found_hoard(Hoard.new(:hammer, 50))
    @player.found_hoard(Hoard.new(:hammer, 50))
    
    @player.to_s.should == "I'm Bimbo with health = 50, points = 100 and score = 150"
  end
    
    it "increase the health by 15 when w00ted" do
      @player.w00t
      
      @player.health.should == @initial_health + 15
    end
    
    it "decrease the health by 10 when w00ted" do
      @player.blam
      
      @player.health.should == @initial_health - 10
    end
  
  context "create default health value" do
    before do
      @player = Player.new("tunji")
    end
    
    it "has a health value of 0" do
      @player.health.should == 0
    end
  end
  
  context "create a player with an initial health of 100" do
    before do
      @player = Player.new("adeola", 100)      
    end
    
    it "is strong" do      
      @player.should be_strong
    end
    
    it "is not strong" do
      @player = Player.new("abiola", 90)
      
      @player.should_not be_strong
    end
  end
  
  it "computes a score as the sum of its health and points" do
    @player.found_hoard(Hoard.new(:hammer, 50))
    @player.found_hoard(Hoard.new(:hammer, 50))
    
    @player.score.should == 150
  end
  
  it "computes points as the sum of all hoard points" do
    @player.points.should == 0
    
    @player.found_hoard(Hoard.new(:hammer, 50))

    @player.points.should == 50

    @player.found_hoard(Hoard.new(:crowbar, 400))
  
    @player.points.should == 450
  
    @player.found_hoard(Hoard.new(:hammer, 50))

    @player.points.should == 500
  end
  
  it "yields each found hoard and its total points" do
    @player.found_hoard(Hoard.new(:skillet, 100))
    @player.found_hoard(Hoard.new(:skillet, 100))
    @player.found_hoard(Hoard.new(:hammer, 50))
    @player.found_hoard(Hoard.new(:bottle, 5))
    @player.found_hoard(Hoard.new(:bottle, 5))
    @player.found_hoard(Hoard.new(:bottle, 5))
    @player.found_hoard(Hoard.new(:bottle, 5))
    @player.found_hoard(Hoard.new(:bottle, 5))
  
    yielded = []
    @player.each_found_hoard do |hoard|
      yielded << hoard
    end
  
    yielded.should == [
      Hoard.new(:skillet, 200), 
      Hoard.new(:hammer, 50), 
      Hoard.new(:bottle, 25)
   ]
  end
  
  it "can be created from a CSV string" do  
    player = Player.from_csv("bimbo,50")
    
    player.name.should == "Bimbo"
    player.health.should == 50
  end
end
end 


















