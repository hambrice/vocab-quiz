require_relative "../lib/game.rb"
require "pry"

class CLI 
  
  def input_valid?(input)
    input.include?("vocabulary.com/lists/") || input.to_i > 0 && input.to_i < 5
  end
  
  def run
    puts "Welcome to your Vocabulary Quiz! This quiz is built on lists created by vocabulary.com."
    sleep(1)
    puts "To get started, please choose a vocabulary category to begin!"
    sleep(1)
    puts "1. Most Difficult SAT Words(300 words)"
    sleep(0.5)
    puts "2. Armed Services Vocational Aptitude Battery (ASVAB) Word Knowledge (100 words)"
    sleep(0.5)
    puts "3. GRE High Frequency Words (334 words)"
    sleep(0.5)
    puts "4. Lights"
    sleep(0.5)
    puts "Select a list by entering its corresponding number."
    sleep(0.25)
    puts "Don't like any of these options?" 
    puts "You can also provide your own list by entering the URL of the list from vocabulary.com."
    input = gets.strip
    while !self.input_valid?(input)
      puts "Sorry, I didn't recognize that."
      puts "Please select a provided list with its corresponding number."
      puts "Or find your own list on vocabulary.com and enter the URL."
      input = gets.strip
    end
    puts "Great! You will be given a word and must select its definition from the given options by entering the number that corresponds to the correct answer."
    puts "You can type exit at any time to quit. Type anything to begin!"
    gets
    game = Game.new(dictionary)
    game.play
    #game.play(Dictionary.new("https://www.vocabulary.com/lists/191545").words)
    #puts "Thanks for playing! You got #{game.correct_count} correct!"
  end 
end

CLI.new.run

