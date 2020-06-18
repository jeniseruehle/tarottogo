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
      cardset = {
        name: html.css("h3").text,
        card_url: html.css("a").attribute("href").value
      }
      cards << cardset
    end
  cards 
 end 
 
 def self.scrape_card_meaning(index_url)
   card = {}
   html = Nokogiri::HTML(open(index_url))
   card[:meaning] = html.css("div.rte.rte--indented-images").text
 end 

end

