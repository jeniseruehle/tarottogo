require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def initialize(cardset_url)
    @cardset_url = cardset_url
  end 
  
  def scrape 
    scrape_cardsets
  end 
  
  def scrape_cardsets
    array = []
    html = Nokogiri::HTML(open(@cardset_url))
    html.css('div[class=cardboxwrapper]').each do |cardset|
      cardset_hash = {
        set: cardset.css('a').attr('href').value,
        cards_url: "https://www.biddytarot.com/tarot-card-meanings/#{card.css('a').attr('href').value}"}
      array << cardset_hash
    end
  array
 end 
 
 def self.scrape_by_card(input)
   url = Tarottogo::Cardset.select_by_name(input)
   card_array = []
   html = Nokogiri::HTML(open(url))
   card_hash = {}
   
   card_hash[:name] = html.css('h4.gold.centered.center.upper')[0].text
   card_hash[:meaning] = html.css('h2.small.purple.upper.center.centered')[0].text 
   card_hash[:website] = html.css('div.card_item a').attr('href')
   
   card_array << card_hash
   card_array
 end 

end

