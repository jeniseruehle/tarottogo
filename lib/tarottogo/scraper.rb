require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def self.scrape_cardsets(cardset_url)
    cards_array = []
    index = Nokogiri::HTML(open(cardset_url))
    index.css("div#biddy_card_list").each do |cards|
      cardset_hash = {
        name: cards.css(".gold.centered.center.upper").text,
        url: "https://www.biddytarot.com/#{cards.css('a').attribute('href').value}"
        }
      cards_array << cardset_hash
    end
    cards_array
  end 
 
  def self.scrape_card_page(card_url)
   card = {}
   index = Nokogiri::HTML(open(card_url))
   description = index.css(".col.span_8 p span.purple.bold").collect {|m| m.text}
   description.each do |c|
     if c.include?("UPRIGHT")
       card[:upright] = c 
     elsif c.include?("REVERSED")
       card[:reversed] = c
     end
  end 
  card
end 
