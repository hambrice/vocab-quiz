require "pry"
require_relative "../lib/scraper.rb"

class Dictionary
  attr_reader :words
  
  def initialize (url)
    @words = Scraper.new.scrape_dictionary(url)
  end
  
  def define(word)
    @words[word]
    binding.pry
  end
end

dictionary = Dictionary.new("https://www.vocabulary.com/lists/1748998").define("luminous")
