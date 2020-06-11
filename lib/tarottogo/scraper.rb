require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def self.get_page
    get_page = Nokogiri::HTML(open("https://labyrinthos.co/blogs/tarot-card-meanings-list"))
    cards = []
    get_page.css("div.grid.tarot-list.page").each do |cardset|
      cardset.css("grid__item large--one-quarter medium--one-third text-center card").each do |card|
      card_name = card.css("h3").text
      card_meaning = card.css("div.rte.rte--indented-images")
    cards << {name: card_name, meaning: card_meaning}  
    end
  end 
  cards 
 end 

end
