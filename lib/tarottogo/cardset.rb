require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Cardset
  attr_accessor :set, :name, :card_url, :meaning
 
  @@all = [] 
  
  def initialize(cardset_hash)
    self.send('set=', cardset_hash[:set])
    self.send('card_url=', cardset_hash[:card_url])
     @@all << self 
  end 
  
  def self.create_from_set(card_array)
    card_array.each do |cardset_hash|
      self.new(cardset_hash)
    end 
  end 
  
  def self.print 
    self.all.each_with_index do |card, index|
      puts "#{index + 1}. #{card.name}"
    end
  end 

  def self.select_by_name(input)
    card_variable = self.all.find {|c| input == c.name}
    card_variable.card_url
  end 
    
  def self.all 
    @@all
  end 
  
  def self.destroy
    @@all.clear
  end 
end 