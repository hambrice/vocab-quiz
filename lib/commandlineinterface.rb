require_relative "../lib/game.rb"
require "pry"

class CLI 
  
  def run
    puts "Welcome to your Vocabulary Quiz! This quiz is built on lists created by vocabulary.com."
    puts "You will be given a word and must select its definition from the given options by entering the number that corresponds to the correct answer."
    puts "Type anything to begin!"
    gets
    game = Game.new
    game.play(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)
    puts "Good work! You got #{game.correct_count} correct!"
  end 
end

CLI.new.run