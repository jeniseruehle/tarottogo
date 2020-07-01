require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
  
  def self.scrape_cardsets(cardset_url)
    index = Nokogiri::HTML(open(cardset_url))
    cards_array = []
    index.css("div#biddy_card_list").each do |cards|
      cards.css(".card-item-content").each do |single| 
        card_name = single.css(".gold.centered.center.upper").text
        cards_array << {name: card_name}
      end 
    end
    cards_array
  end 
 
  def self.scrape_card_page(card_url)
   card_meaning = {}
   index = Nokogiri::HTML(open(card_url))
   meaning = index.css(".col.span_8 p span.purple.bold").each do |mean|
     if mean.include?("UPRIGHT")
       card_meaning[:upright] = mean.text 
     elsif mean.include?("REVERSED")
       card_meaning[:reversed] = mean.text
     end
  end 
  card_meaning[:name_keywords] = index.css('h3.center.lightpurple.fs24.bold.padbot15').text
end 
end 
