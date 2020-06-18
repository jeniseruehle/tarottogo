require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def self.scrape_index(index_url)
    cards = []
    html = Nokogiri::HTML(open(index_url))
    html.css("div#biddy_card_list").each do |card|
      cardset = {
        name: html.css(".gold.centered.center.upper")
        card_url: html.css("a").attribute("href").value
      }
      cards << cardset
    end
  cards 
 end 
 
 def self.scrape_ma_card(card_url)
   card = {}
   html = Nokogiri::HTML(open(card_url))
   container = html.css

end

