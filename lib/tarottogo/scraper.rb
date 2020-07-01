require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
  
  def self.scrape_cardsets(cardset_url)
    index = Nokogiri::HTML(open(cardset_url))
    cards_array = []
    index.css("div#biddy_card_list").each do |cards|
      cards.css(".card_item a").each do |single| 
        card_link = "#{single.attr('href')}"
        card_name = single.css(".gold.centered.center.upper").text
        cards_array << {name: card_name}
      end 
    end
    cards_array
  end 
 
  def self.scrape_card_page(input)
   card_url = Tarot.select_by_card(input)
   meaning_array = []
   index = Nokogiri::HTML(open(card_url))
   card_hash = {}
   
   card_hash[:name_keywords] = index.css('h3.center.lightpurple.fs24.bold.padbot15').text
   
   index.css(".col.span_8 p span.purple.bold").each do |mean|
     if mean.text.include?("UPRIGHT")
       card_hash[:upright] = mean.text 
     elsif mean.text.include?("REVERSED")
       card_hash[:reversed] = mean.text
     end
  end 
  meaning_array << card_hash
  meaning_array
end 
end 
