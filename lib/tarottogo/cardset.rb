require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Cardset
  attr_accessor :name, :meaning
 
  @@all = [] 
  
  def initialize(cardset_hash)
  end 
  
  def major_arcana
    @ma = Scraper.major_arcana 
  end 
  
end 