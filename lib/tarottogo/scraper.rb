require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
  
  def self.scrape_cardsets(cardset_url)
    cards_array = []
    index = Nokogiri::HTML(open(cardset_url))
    index.css("div#biddy_card_list").each do |cards|
      cards.css(".card-item-content").each do |single| 
        card_name = single.css("h4.gold.centered.center.upper").text,
        single_url = "https://www.biddytarot.com/#{single.css('a').attribute('href').value}"
      cards_array << {name: card_name, url: single_url}
      end 
    end
    cards_array
  end 
 
  def self.scrape_card_page(input)
   card_url = Tarot.select_by_card(input)  
   description_array = []
   index = Nokogiri::HTML(open(card_url))
   card_hash = {}
   
   card[:name_keywords] = index.css('h3.center.lightpurple.fs24.bold.padbot15').text
   
   description = index.css(".col.span_8 p span.purple.bold").collect {|m| m.text}
   description.each do |c|
     if c.include?("UPRIGHT")
       card[:upright] = c.text 
     elsif c.include?("REVERSED")
       card[:reversed] = c.text
     end
  end 
  description_array << card_hash
  description_array
end 
end 
