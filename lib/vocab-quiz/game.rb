require_relative "../vocab-quiz/question.rb"

class VocabQuiz::Game
attr_accessor :correct_count, :dictionary, :question_count
@@questions = []

  def initialize(dictionary, amount)
    @dictionary = dictionary
    @correct_count = 0
    @question_count = amount
    
  end
  
  def score
    self.correct_count.to_f / @@questions.length*100
  end
  
  def over?
    self.dictionary.count == VocabQuiz::Question.used_words.length || self.question_count == VocabQuiz::Question.used_words.length
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
    array = ["a","b","c","d"]
    puts "#{@@questions.length}. What is the definition of '#{question.word}'?\n\n"
    question.options.each.with_index(0) do |option,index|
      puts "#{array[index]}. #{option.capitalize}"
    end
  end
  
   def letter_to_number(input)
    case input.downcase
    when "a"
      input = "1"
    when "b"
      input = "2"
    when "c"
     input = "3"
    when "d"
      input = "4"
    end
    input
  end
  
  def valid_input?(input)
    input = self.letter_to_number(input)
    input.to_i > 0 && input.to_i < 5 || input == "exit"
  end
  
  def result
    puts "Thanks for playing!\n\n"
    puts "You got #{self.correct_count} correct out of a possible #{@@questions.length}.\n\n"
    sleep(0.5)
  end
  
  def play
    while !over?
    sleep(1)
     question = self.build_question(VocabQuiz::Question.new)
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
        self.result
        return
      elsif question.correct?(self.letter_to_number(input).to_i)
        self.correct_count += 1
        puts "Correct!\n\n"
      else 
        puts "Sorry, that's incorrect.\n\n"
      end
    end
    sleep(0.5)
    puts "Whew, that's it. Youre done!\n\n"
    self.result
  end
      
end