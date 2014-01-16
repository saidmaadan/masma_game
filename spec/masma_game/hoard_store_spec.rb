require 'masma_game/hoard_store'

module MasmaGame   
describe Hoard do
  
  before do
    @hoard = Hoard.new(:hammer, 50)
  end
  
  it "has a name attribute" do
    @hoard.name.should == :hammer
  end
  
  it "has a points attribute" do
    @hoard.points.should == 50
  end
  
end

describe HoardStore do
  
  it "has six hoard" do
    HoardStore::HOARDS.size.should == 6
  end
  
  it "has a pie worth 5 points" do
    HoardStore::HOARDS[0].should == Hoard.new(:pie, 5)
  end
  
  it "has a bottle worth 25 points" do
    HoardStore::HOARDS[1].should == Hoard.new(:bottle, 25)
  end
  
  it "has a hammer worth 50 points" do
    HoardStore::HOARDS[2].should == Hoard.new(:hammer, 50)
  end
  
  it "has a skillet worth 100 points" do
    HoardStore::HOARDS[3].should == Hoard.new(:skillet, 100)
  end

  it "has a broomstick worth 200 points" do
    HoardStore::HOARDS[4].should == Hoard.new(:broomstick, 200)
  end
  
  it "has a crowbar worth 400 points" do
    HoardStore::HOARDS[5].should == Hoard.new(:crowbar, 400)
  end
  
  it "returns a random hoard" do
    hoard = HoardStore.random
    
    HoardStore::HOARDS.should include(hoard)
  end
end
end
  

