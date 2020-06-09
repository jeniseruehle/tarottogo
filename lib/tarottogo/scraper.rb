require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
attr_accessor :set_1, :set_2, :set_3, :set_4, :set_5, :major_arcana, :ma_meaning, :wands, :w_meaning, :cups, :c_meaning, :swords, :s_meaning, :pentacles, :p_meaning
  
  def self.card
    self.scrape_cards
  end
  
  def self.scrape_cards
    cardset = []
    
    cardset << self.scrape_set_titles
    
    cardset
  end 
  
  def self.scrape_set_titles
    first = Nokogiri::HTML(open("https://labyrinthos.co/blogs/tarot-card-meanings-list"))
    
    cards = self.new
      
    cards.set_1 = first.css("#majorarcana h2.text-center").text
    cards.set_2 = first.css("#wands h2.text-center").text
    cards.set_3 = first.css("#cups h2.text-center").text
    cards.set_4 = first.css("#swords h2.text-center").text
    cards.set_5 = first.css("#pentacles h2.text-center").text
    
    cards 
  end 
  
  def self.scrape_meanings
    second = Nokogiri::HTML(open("https://labyrinthos.co/blogs/tarot-card-meanings-list"))
    
    card_meanings = self.new
    
    cards.major_arcana = second.css("#majorarcana h3").text 
      cards.ma_meaning = second.css("#majorarcana div.rte.rte--indented-images").text
      
    cards.wands = second.css("#wands h3").text 
      cards.w_meaning = second.css("#wands div.rte.rte--indented-images").text
    
    cards.cups = second.css("#cups h3").text 
      cards.c_meaning = second.css("#cups div.rte.rte--indented-images").text
      
    cards.swords = second.css("#swords h3").text 
      cards.s_meaning = second.css("#swords div.rte.rte--indented-images").text
      
    cards.pentacles = second.css("#pentacles h3").text
      cards.p_meaning = second.css("#pentacles div.rte.rte--indented-images").text

    card_meanings    
  end 
end

