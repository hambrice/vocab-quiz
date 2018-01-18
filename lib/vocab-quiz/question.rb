require_relative "../vocab-quiz/dictionary.rb"

class Question
 @@used_words = []
 attr_accessor :options, :answer_index, :answer, :word
 
  def self.used_words
    @@used_words
  end
    
  def correct?(input)
    self.correct?(self.letter_to_index(input)) if input.to_i == 0
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