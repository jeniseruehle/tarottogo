require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Cardset
  attr_accessor :name, :meaning
 
  @@all = [] 
  
  def self.new_from_index(card)
    self.new(
      card.css("h4").text,
      "https://www.biddytarot.com/#{card.attribute("href").text}",
      card.css("span.card-item-content").text,
      card.css("p")[1].text
      )
  end 
  
  def initialize(name=nil, meaning=nil)
    @name = name 
    @meaning = meaning 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.find(id)
    self.all[id-1]
  end 
  
  def name 
    @name ||= doc.css("h4.gold.centered.center.upper").text
  end 
  
  def meaning
    @meaning ||= doc.css("").text
  end 
  
end 