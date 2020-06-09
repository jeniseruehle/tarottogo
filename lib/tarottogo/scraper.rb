require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
attr_accessor :set_1, :set_2, :set_3, :set_4, :set_5
  
  def self.card
    self.scrape_cards
  end
  
  def self.scrape_cards
    cardset = []
    
    cardset << self.scrape_set_titles
    
    cardset
  end 
  
  def self.scrape_set_titles
    doc = Nokogiri::HTML(open("https://labyrinthos.co/blogs/tarot-card-meanings-list"))
    
    cards = self.new
      
    cards.set_1 = doc.search("#majorarcana h2.text-center").text
    cards.set_2 = doc.search("#wands h2.text-center").text
    cards.set_3 = doc.search("#cups h2.text-center").text
    cards.set_4 = doc.search("#swords h2.text-center").text
    cards.set_5 = doc.search("#pentacles h2.text-center").text
    
    cards 
  end 
  
  # def self.scrape_meanings
  #   card_meanings = {}
  #   doc = Nokogiri::HTML(open("https://labyrinthos.co/blogs/tarot-card-meanings-list"))
    
  #   # major_arcana = doc.search("#majorarcana h3").text 
  #   #   #doc.search("#majorarcana div.rte.rte--indented-images").text
  #   # wands = doc.search("#wands h3").text 
  #   # cups = doc.search("#cups h3").text 
  #   # swords = doc.search("#swords h3").text 
  #   # pentacles = doc.search("#pentacles h3").text

    
  # end 
  
end 
