require_relative "../lib/game.rb"
require "pry"

class CLI 
  
  def run
    puts "Welcome to your Vocabulary Quiz! This quiz is built on lists created by vocabulary.com."
    sleep(3)
    puts "To get started, please choose a vocabulary category to begin!"
    sleep(4)
    puts "1. 300 Most Difficult SAT Words"
    sleep(0.5)
    puts "2. Armed Services Vocational Aptitude Battery (ASVAB) Word Knowledge"
    sleep(0.5)
    puts "3. GRE High Frequency Words"
    sleep(0.5)
    puts "4. Lights"
    sleep(0.5)
    puts "Select a list by entering its corresponding number."
    input = gets.strip
    puts "Great! You will be given a word and must select its definition from the given options by entering the number that corresponds to the correct answer."
    puts "You can type exit at any time to quit. Type anything to begin!"
    gets
    game = Game.new(input)
    game.play
    #game.play(Dictionary.new("https://www.vocabulary.com/lists/191545").words)
    #puts "Thanks for playing! You got #{game.correct_count} correct!"
  end 
end

CLI.new.run