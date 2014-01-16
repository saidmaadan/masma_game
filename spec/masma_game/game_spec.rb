require 'masma_game/game'

module MasmaGame
describe Game do
  
  before do
    @game = Game.new("chess")
    
    @initial_health = 80
    @player = Player.new("biola", @initial_health)
    
    @game.add_player(@player)
  end
  
  it "has a name" do
    @game.name.should == "Chess"
  end
  
  it "w00ts the player if a high number is rolled" do
      Die.any_instance.stub(:roll).and_return(5)
        
      @game.play(2)
    
      @player.health.should == @initial_health + (15 * 2)
    end
  
    it "skips the player if a medium number is rolled" do
      Die.any_instance.stub(:roll).and_return(3)
        
      @game.play(2)
    
      @player.health.should == @initial_health
    end
  
    it "blams the player if a low number is rolled" do
      Die.any_instance.stub(:roll).and_return(1)
        
      @game.play(2)
    
      @player.health.should == @initial_health - (10 * 2)
    end
    
    it "assigns a treasure for points during a player's turn" do     
      game = Game.new("chess")
      player = Player.new("biolae")
       
      game.add_player(player)
    
      game.play(1)
    
      player.points.should_not be_zero
    end
    
    it "computes total points as the sum of all player points" do     
      game = Game.new("chess")
      
      player1 = Player.new("biola")
      player2 = Player.new("bimbo")
     
      game.add_player(player1)
      game.add_player(player2)
    
      player1.found_hoard(Hoard.new(:hammer, 50))
      player1.found_hoard(Hoard.new(:hammer, 50))
      player2.found_hoard(Hoard.new(:crowbar, 400))
    
      game.total_points.should == 500
    end
  end  
end