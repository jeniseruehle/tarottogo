require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Tarot
  attr_accessor :name, :url, :upright, :reversed
  
  @@all = []
  
  def initialize(card_hash)
    card_hash.each {|k, v| self.send ("#{k}="), v}
    @@all << self 
  end 
  
  def create_from_set(card_array)
    card_array.each do |card_hash| 
      self.new(card_hash)
    end 
  end 
  
end 