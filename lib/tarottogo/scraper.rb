require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def self.scrape_cardsets(cardset_url)
    cards_array = []
    index = Nokogiri::HTML(open(cardset_url))
    index.css("div.card_item").each do |cards|
      cardset_hash = {
        name: cards.css(".gold.centered.center.upper").text,
        url: cards.css("a").attribute("href").value
        }
      cards_array << cardset_hash
    end
  cards_array
 end 
 
 def self.scrape_card_page(card_url)
   card = {}
   index = Nokogiri::HTML(open(card_url))
   meanings = card_meaning.css(".card-item-content").children.map(&:descendants).flatten
   meanings.each do |card|
     if card.include?("upright")
       tarot[:upright] = card 
     elsif card.include?("reversed")
       tarot[:reversed] = card
     else 
       tarot[:name] = card
     end
  end 
end 
end 
