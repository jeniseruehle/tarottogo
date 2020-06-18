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
  
  def scrape_cardsets(cardset_url)
    array = []
    html = Nokogiri::HTML(open(@cardset_url))
    html.css("grid.tarot-list.page").each do |cardset|
      cardset_hash = {
        set: cardset.css('section.suit').text,
        card_url: "https://labyrinthos.co/blogs/tarot-card-meanings-list#{card.css('a').attr('href').value}"}
      array << cardset_hash
    end
  array
 end 
 
 def self.scrape_card_meaning(input)
   url = Cardset.select_by_name(input)
   card_array = []
   html = Nokogiri::HTML(open(url))
   card_hash = {}
   
   card_hash[:name] = html.css('h3')[0].text
   card_hash[:meaning] = html.css('div.rte.rte--intended-images').text 
   
   card_array << card_hash
   card_array
 end 

end

