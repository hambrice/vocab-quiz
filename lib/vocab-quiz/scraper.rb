require 'nokogiri'
require 'open-uri'
class VocabQuiz::Scraper
  attr_accessor :url
  
  def build_url(input)
   if input.include?("vocabulary.com/lists/")
     self.url = "https://www.vocabulary.com/lists/#{input.split("lists/")[1]}"
   else
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
  end
  
  def dictionary_title
    doc = Nokogiri::HTML(open(self.url))
    title = doc.css("h1").text
    end
    
  def build_dictionary(input)
    self.build_url(input)
    words = {}
    title = self.dictionary_title
    doc = Nokogiri::HTML(open(self.url))
    page = doc.css(".entry")
    page.each do |s|
      words[s.css(".word").text] = s.css(".definition").text
    end
    VocabQuiz::Dictionary.new(words,title)
  end
end