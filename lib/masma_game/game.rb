require_relative 'player'
require_relative 'die'
require_relative 'next_game'
require_relative 'hoard_store'

module MasmaGame
class Game
  attr_accessor :name
  
  def initialize(name)
    @name = name.capitalize
    @player = []
  end
  
  def add_player(player)
    @player << player
  end
  
  def total_points
    @player.reduce(0) { |sum, player| sum + player.points}
  end
  
  def high_score_entry(p)
    formatted_name = p.name.ljust(20, '.')
    "#{formatted_name} #{p.score}"
  end
  
  def play(rounds)
    puts "There are #{@player.size} players in #{@name} game"
    
    @player.each do |player|
    puts player
  end
  
    hoards = HoardStore::HOARDS
    puts "\nThere are #{hoards.size} hoards to be found"
    
    hoards.each do |hoard|
      puts "A #{hoard.name} is worth #{hoard.points} points"
    end
    
    puts "---------------------------------"
    1.upto(rounds) do |n|
      puts "\nRound #{n}"
    @player.each do |p|
      NextGame.next_player(p)
      hoard = HoardStore.random      
      puts "#{p.name} found a #{hoard.name} worth #{hoard.points} points"
       puts p
   end
 end
  end
  
  def print_stats
    puts "\n#{@name} Statistics:"
    
    puts "#{total_points} total points from hoards found"    
    @player.each do |p|
      puts "\n#{p.name}'s point totals"
      p.each_found_hoard do |hoard|
        puts "#{hoard.points} total #{hoard.name} points"
      end
      puts "#{p.points} grand total points"
    end
        
    
    strong, wimpy = @player.partition {|p| p.strong?}
    
    puts "\n#{strong.size} Strong Players:"
    strong.each do |p|
    puts "#{p.name} (#{p.health})"
  end
    
    puts "\n#{wimpy.size} Wimpy Players:"
    wimpy.each do |p|
    puts "#{p.name} (#{p.health})"
  end
  
  puts "\n#{@name} High Scores:"
    @player.sort.each do |p|
    puts "#{p.name.ljust(25, '-')} #{p.score}"
  end
end
  
  def load_players(from_file)
    File.readlines(from_file).each do |line|
      add_player(Player.from_csv(line))
    end
  end
  
  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@name} High Scores:"
      @player.sort.each do |p|
        file.puts high_score_entry(p)
      end
    end
  end
end
end
  
