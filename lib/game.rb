require "pry"
require_relative "../lib/question.rb"

class Game
attr_accessor :correct_count, :dictionary

  def initialize(input)
    @dictionary = Scraper.new.build_dictionary(input)
    @correct_count = 0
    
  end
  
  def over?
    Dictionary.count == Question.used_words.count
  end
  
  def exit
    puts "Thanks for playing! You got #{self.correct_count} correct!"
  end
  
   def build_question(question)
   question.select_options(self.dictionary.words)
   question.options << "placeholder"
   question.answer_index = rand (0..3)
   question.options.insert(question.answer_index, question.answer)
   question.options.delete("placeholder")
   #binding.pry
   
   #binding.pry
  end
  
  def puts_question(question)
    puts "What is the definition of '#{question.word}'?"
    question.options.each.with_index(1) do |option,index|
      puts "#{index}. #{option.capitalize}"
    end
  end
  
  def valid_input?(input)
    input.to_i > 0 && input.to_i < 5
  end
  
  def play
    while !over?
      question = Question.new
      self.build_question(question)
     input = self.puts_question(question)
     # puts "What is the definition of '#{question.word}'?"
   #question.options.each.with_index(1) do |option,index|
     #puts "#{index}. #{option.capitalize}"
  # end
      input = gets.strip
      if input == "exit"
        self.exit
        return
      #elsif input.to_i < 1 || input.to_i > 4
       # puts "Sorry! I didn't recognize your answer. Please pick an option that corresponds to one of the given answers."
        #self.puts_question(question)
      elsif question.correct?(input.to_i)
        self.correct_count += 1
        puts "Correct!"
      else 
        puts "Sorry, that's incorrect."
      end
    end
    puts "Good work! You got #{self.correct_count} correct!"
  end
      
end

#Game.new.play(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)