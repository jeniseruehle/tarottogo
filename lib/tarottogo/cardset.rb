require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Tarot 
attr_accessor :set, :card, :meaning, :url 
  
  def self.card
    self.scrape_cards
  end
  
  def self.scrape_cards
    cardset = []
    
    cardset << self.scrape_lbrs
    
    cardset
  end 
  
  def self.scrape_sets
    doc = Nokogiri::HTML(open("https://labyrinthos.co/blogs/tarot-card-meanings-list"))
    set_1 = doc.search("#majorarcana h2.text-center").text
    set_2 = doc.search("#wands h2.text-center").text
    set_3 = doc.search("#cups h2.text-center").text
    set_4 = doc.search("#swords h2.text-center").text
    set_5 = doc.search("#pentacles h2.text-center").text
    binding.pry 
    
  end 
  
end 



# Tarottogo::TarotScraper.new("https://labyrinthos.co/blogs/tarot-card-meanings-list")

# cardset_1 = Tarottogo::Tarot.new 
    # cardset_1.set = "Major Arcana"
    # cardset_1.card = "Card Name"
    # cardset_1.meaning = "Description"
    # cardset_1.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    # cardset_2 = Tarottogo::Tarot.new 
    # cardset_2.set = "Wands"
    # cardset_2.card = "Card Name"
    # cardset_2.meaning = "Description"
    # cardset_2.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    # cardset_3 = Tarottogo::Tarot.new 
    # cardset_3.set = "Cups"
    # cardset_3.card = "Card Name"
    # cardset_3.meaning = "Description"
    # cardset_3.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    # cardset_4 = Tarottogo::Tarot.new 
    # cardset_4.set = "Swords"
    # cardset_4.card = "Card Name"
    # cardset_4.meaning = "Description"
    # cardset_4.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    # cardset_5 = Tarottogo::Tarot.new 
    # cardset_5.set = "Pentacles"
    # cardset_5.card = "Card Name"
    # cardset_5.meaning = "Description"
    # cardset_5.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    # [cardset_1, cardset_2, cardset_3, cardset_4, cardset_5]