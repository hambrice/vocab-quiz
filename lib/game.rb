require "pry"
require_relative "../lib/question.rb"

class Game
attr_accessor :correct_count, :dictionary
@@questions = []

  def initialize(input)
    @dictionary = Scraper.new.build_dictionary(input)
    @correct_count = 0
    
    
  end
  
  def score
    self.correct_count.to_f / @@questions.length*100
    binding.pry
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
    @@questions << question
    question
  end
  
  def puts_question(question)
    puts "What is the definition of '#{question.word}'?"
    question.options.each.with_index(1) do |option,index|
      puts "#{index}. #{option.capitalize}"
    end
  end
  
  def valid_input?(input)
    input.to_i > 0 && input.to_i < 5 || input == "exit"
  end
  
  def result
    puts "You got #{self.correct_count} correct out of a possible #{@@questions.length}."
    if score == 0
      puts "Errr.. Atleast you're pretty?"
    if score > 0 || score < 20
      puts 
  end
  
  def play
    while !over?
     question = self.build_question(Question.new)
     self.puts_question(question)
     input = gets.strip
     while !self.valid_input?(input)
      puts "Sorry! I didn't recognize your answer."
      puts "Please pick an option that corresponds to one of the given answers."
      puts ""
      sleep(1)
      self.puts_question(question)
      input = gets.strip
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
    puts self.score
    puts "Good work! You got #{self.correct_count} correct out of a possible #{@@questions.length}!"
  end
      
end

#Game.new.play(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)