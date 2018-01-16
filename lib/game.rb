require "pry"
require_relative "../lib/question.rb"

class Game
attr_accessor :correct_count

  def initialize
    @correct_count = 0
  end
  
  def over?
    Dictionary.count == Question.used_words.count
  end
  
  def play(hash)
    while !over?
      question = Question.new
      question.build_question(hash)
      input = gets.strip
      if input == "exit"
        return
        elsif question.correct?(input.to_i)
        self.correct_count += 1
        puts "Correct!"
      else 
        puts "Sorry, that's incorrect."
      end
    end
  end
      
end

#Game.new.play(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)