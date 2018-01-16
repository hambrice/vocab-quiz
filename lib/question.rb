require "pry"
require_relative "../lib/dictionary.rb"

class Question
 @@used_words = []
 attr_reader :word, :answer
 
  def select_word(hash)
   array = hash.keys
   number = rand(1..array.length+1)
   while @@used_words.include? (array[number])
     self.select_word(hash)
   end
   @@used_words << array[number]
   @answer = Dictionary.define(array[number])
   @word = array[number]
 end

 def options 
   @options = []
 end
 
 def select_options(hash)
   
   self.select_word(hash)
   array = hash.values.delete_if {|p| p == @answer}
   #binding.pry
   3.times do
     number = rand(1..array.length+1)
     self.options << array[number]
     array[number].delete(array[number])
   end
  self.options
 end
 
 def build_question(hash)
   select_options(hash)
   number = rand (0..self.options.length+1)
   self.options
   puts "What is the definition of #{@word}?"
   
   
   
 end
end

Question.new.select_options(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)