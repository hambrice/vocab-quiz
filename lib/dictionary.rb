require "pry"
require_relative "../lib/scraper.rb"

class Dictionary
  attr_reader :count, :title
  
  def initialize(hash, title)
    @words = hash
    @title = title
  end
  
  def define(word)
    @words[word]
  end
  
  
  def words
    @words
  end
  
  def count
    @count = @@words.keys.length
  end
end

#dictionary = Dictionary.new("https://www.vocabulary.com/lists/1748998").define("luminous")
