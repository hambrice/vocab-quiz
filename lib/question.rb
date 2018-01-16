require "pry"
require_relative "../lib/dictionary.rb"

class Question
 @@used_words = []
 attr_accessor :options, :answer_index
 attr_reader :word, :answer
 
  def select_word(hash)
   array = hash.keys
   number = rand(0..array.length-1)
   while @@used_words.include? (array[number])
     self.select_word(hash)
   end
   @@used_words << array[number]
   @answer = Dictionary.define(array[number])
   @word = array[number]
 end

 
 def select_options(hash)
   self.options = []
   self.select_word(hash)
   array = hash.values.delete_if {|p| p == @answer}
   #binding.pry
   3.times do
     number = rand(0..array.length-1)
     self.options << array[number]
     array.delete(array[number])
   end
   #binding.pry
  self.options
 end
 
 def build_question(hash)
   select_options(hash)
   self.options << "placeholder"
   self.answer_index = rand (0..3)
   self.options.insert(self.answer_index, @answer)
   self.options.delete("placeholder")
   #binding.pry
   puts "What is the definition of '#{@word}'?"
   self.options.each.with_index(1) do |option,index|
     puts "#{index}. #{option.capitalize}"
   end
  end
  
  def correct?(input)
    input == self.answer_index
  end
end

#Question.new.build_question(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)