require "pry"
require_relative "../lib/scraper.rb"

class Dictionary
  attr_reader :count, :title, :words
  
  def initialize(words, title)
    @words = words
    @title = title
  end
  
  def define(word)
    @words[word]
  end
  
  def count
    @count = @words.keys.length
  end
end

#dictionary = Dictionary.new("https://www.vocabulary.com/lists/1748998").define("luminous")
