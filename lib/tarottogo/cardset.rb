require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Cardset
  attr_accessor :name, :meaning
 
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

  def self.all 
    @@all
  end 

  
end 