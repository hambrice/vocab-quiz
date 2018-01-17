require "pry"
require_relative "../lib/question.rb"

class Game
attr_accessor :correct_count, :dictionary
@@questions = []

  def initialize(dictionary)
    @dictionary = dictionary
    @correct_count = 0
    
    
  end
  
  def score
    self.correct_count.to_f / @@questions.length*100
  end
  
  def over?
    self.dictionary.count == Question.used_words.count
  end
  
  def exit
    self.result
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
    puts "What is the definition of '#{question.word}'?\n\n"
    question.options.each.with_index(1) do |option,index|
      puts "#{index}. #{option.capitalize}"
    end
  end
  
  def valid_input?(input)
    input.to_i > 0 && input.to_i < 5 || input == "exit"
  end
  
  def result
    puts "Thanks for playing!\n\n"
    puts "You got #{self.correct_count} correct out of a possible #{@@questions.length}.\n\n"
    sleep(0.5)
    if score == 0
      puts "Errr.. Atleast you're pretty?"
    elsif score > 0 && score <= 20
      puts "You know, maybe vocabulary isn't your strong suit."
    elsif score > 20 && score <= 40
      puts "You know what they say, don't judge a fish by it's ability to climb a tree. Or memorize vocabulary."
    elsif score > 40 && score <= 60
      puts "You did about as good as if you had just picked the answers randomly. So congrats?"
    elsif score > 60 && score <= 80
      puts "Hey, looks like someone has read a few books!"
    elsif score > 80 && score < 100
      puts "You're a genius!"
    elsif score == 100
      puts "Woah! You're a vocabulary WIZARD!"
    else
      puts "Uhm, what just happened."
    end
  end
  
  def play
    while !over?
    sleep(1)
     question = self.build_question(Question.new(self.dictionary))
     self.puts_question(question)
     input = gets.strip
     while !self.valid_input?(input)
      puts "Sorry! I didn't recognize your answer.\n\n"
      puts "Please pick an option that corresponds to one of the given answers.\n\n\n"
      sleep(1)
      self.puts_question(question)
      input = gets.strip
     end
      if input == "exit"
        self.exit
        return
      elsif question.correct?(input.to_i)
        self.correct_count += 1
        puts "Correct!\n\n"
      else 
        puts "Sorry, that's incorrect.\n\n"
      end
    end
    puts "Whew, that's it. Youre done!\n\n"
    puts self.result
  end
      
end

#Game.new.play(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)