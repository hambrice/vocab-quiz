require "nokogiri"
require "open-uri"
require "pry"

class Scraper
  
  def words(url)
    hash = {}
    doc = Nokogiri::HTML(open(url))
    page = doc.css(".entry")
    #binding.pry
    page.each do |s|
      hash[s.css(".word").text] = s.css(".definition").text
    end
    binding.pry
    hash
  end
end

Scraper.new.words("https://www.vocabulary.com/lists/1748998")