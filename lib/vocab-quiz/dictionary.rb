require_relative "../vocab-quiz/scraper.rb"
class VocabQuiz::Dictionary
  #attr_accessor :title, :words
  attr_reader :count, :title, :words
  
  def initialize(words, title)
    @words = words
    @title = title
  end
  
  
  def count
    @count = @words.keys.length
  end
end
