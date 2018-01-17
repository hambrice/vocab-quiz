require "pry"
require_relative "../lib/dictionary.rb"

class Question
 @@used_words = []
 attr_accessor :options, :answer_index, :answer, :word
 
  def self.used_words
    @@used_words
  end
  
  def letter_to_index(input)
    case input.downcase
    when "a"
      1
    when "b"
      2
    when "c"
      3
    when "d"
      4
    end
  end
    
  def correct?(input)
    if input.to_i == 0
      self.correct?(self.letter_to_index(input))
    end
    #make this blank if blank later!
    input == self.answer_index + 1
  end
  
  def select_word(hash)
   array = hash.keys
   @@used_words.each {|w| array.delete_if {|s| s == w}}
   number = rand(0..array.length-1)
   @@used_words << array[number]
   self.answer = hash[array[number]]
   self.word = array[number]
 end

 
 def select_options(hash)
   self.options = []
   self.select_word(hash)
   array = hash.values.delete_if {|p| p == self.answer}
   3.times do
     number = rand(0..array.length-1)
     self.options << array[number]
     array.delete(array[number])
   end
  self.options
 end
 
end

#Question.new.build_question(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)