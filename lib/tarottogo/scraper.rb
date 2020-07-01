require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def self.scrape_cardsets(cardset_url)
    array = []
    cardset = Nokogiri::HTML(open(cardset_url))
    cards.css("div.card_item").each do |cards|
      cardset_hash = {
        name: cards.css(".gold.centered.center.upper").text,
        url: cards.css("a").attribute("href").value
        }
      array << cardset_hash
    end
  array
 end 
 
 def self.scrape_card_page(card_url)
   tarot = {}
   card_meaning = Nokogiri::HTML(open(card_page))
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
