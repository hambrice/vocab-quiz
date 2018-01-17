require "pry"
require_relative "../lib/scraper.rb"

class Dictionary
  attr_reader :count
  def initialize
    @@words = Scraper.new.scrape_dictionary(url)
  end
  
  def self.define(word)
    @@words[word]
  end
  
  
  def words
    @@words
  end
  
  def self.count
    @count = @@words.keys.length
  end
end

#dictionary = Dictionary.new("https://www.vocabulary.com/lists/1748998").define("luminous")
