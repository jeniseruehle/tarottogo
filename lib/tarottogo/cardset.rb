require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Cardset
  attr_accessor :name, :card_url, :upright, :reversed
 
  @@all = [] 
  
  def initialize(card_set)
    card_set.each do |a, v|
      self.send("#{a}=", v)
    end 
     @@all << self 
  end 
  
  def self.create_from_set(cards_array)
    cards_array.each do |card_set|
      self.new(card_set)
  end 
  
  def card_meanings(meanings_hash)
    meanings_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self 
  end 

  def self.all 
    @@all
  end 

  
end 