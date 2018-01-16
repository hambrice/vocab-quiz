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
 
 def select_options(hash)
   new_array = []
   self.select_word(hash)
   array = hash.values.delete_if {|p| p == @answer}
   #binding.pry
   3.times do
     number = rand(1..array.length+1)
     new_array << array[number]
     array[number].delete(array[number])
   end
     binding.pry
     
 end
 
 def build_question(hash)
   
   
 end
end

Question.new.select_options(Dictionary.new("https://www.vocabulary.com/lists/1748998").words)