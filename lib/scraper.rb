require "nokogiri"
require "open-uri"
require "pry"

class Scraper
  attr_accessor :url
  
  def build_url(input)
    case input
    when "1"
      self.url = "https://www.vocabulary.com/lists/191545"
    when "2"
      self.url = "https://www.vocabulary.com/lists/1154621"
    when "3"
      self.url = "https://www.vocabulary.com/lists/194479"
    when "4"
      self.url = "https://www.vocabulary.com/lists/1748998"
    end
  end
  def build_dictionary(input)
    self.build_url(input)
    hash = {}
    doc = Nokogiri::HTML(open(self.url))
    page = doc.css(".entry")
    page.each do |s|
      hash[s.css(".word").text] = s.css(".definition").text
    end
    Dictionary.new(hash)
  end
end

#Scraper.new.words("https://www.vocabulary.com/lists/1748998")