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
    question
  end
  
  def puts_question(question)
    puts "What is the definition of '#{question.word}'?"
    question.options.each.with_index(1) do |option,index|
      puts "#{index}. #{option.capitalize}"
    end
    input=gets.strip
    input
  end
  
  def valid_input?(input)
    input.to_i > 0 && input.to_i < 5 || input == "exit"
  end
  
  def play
    while !over?
     question = self.build_question(Question.new)
     input = self.puts_question(question)
     while !self.valid_input?(input)
      puts "Sorry! I didn't recognize your answer."
      puts "Please pick an option that corresponds to one of the given answers."
      sleep(1)
      input = self.puts_question(question)
     end
      if input == "exit"
        self.exit
        return
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