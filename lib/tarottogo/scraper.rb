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
    cards = []
    html = Nokogiri::HTML(open(@cardset_url))
    html.css("grid.tarot-list.page").each do |cardset|
      cardset_hash = {
        set: card.css(''),
        card_url: "https://labyrinthos.co/blogs/tarot-card-meanings-list#{card.css('a').attr('href').value}"}
      cards << cardset
    end
  cards 
 end 
 
 def self.scrape_card_meaning(input)
   url = Cardset.select_by_name(input)
   card_array = []
   html = Nokogiri::HTML(open(url))
   card_hash = {}
   
   card_hash[:meaning] = html.css("div.rte.rte--indented-images").text
 end 

end

