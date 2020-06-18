require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def initialize(cardset_url)
    @cardset_url = cardset_url
  end 
  
  def scrape 
    scrape_cards
  end 
  
  def scrape_cards(cardset_url)
    cards = []
    html = Nokogiri::HTML(open(@cardset_url))
    html.css("grid.tarot-list.page").each do |card|
      cardset_hash = {
        set: card.css("h2.text-center").text,
        card: card.css("h3").text,
        card_url: card.css("a").attribute("href").value}
      cards << cardset
    end
  cards 
 end 
 
 def self.scrape_card_meaning(input)
   url = Cardset.select_by_name(input)
   card_array = []
   html = Nokogiri::HTML(open(url))
   card_hash
   card[:meaning] = html.css("div.rte.rte--indented-images").text
 end 

end

