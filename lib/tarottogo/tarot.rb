require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Tarot 
  attr_accessor :name, :url, :name_keywords, :upright, :reversed
  
  @@all = []
  
  def initialize(card_hash)
    self.send('name=', card_hash[:name])
    self.send('url=', card_hash[:url])
    @@all << self 
  end 
  
  def create_from_set(card_array)
    card_array.each do |card_hash| 
      self.new(card_hash)
    end 
  end 
  
  def self.print_all
    self.all.each_with_index do |card, index|
      puts "#{index + 1}. #{card.name}"
    end 
  end 
  
  def self.select_by_card(input)
    card_variable = self.all.find {|c| input == c.name}
    card_variable.url
  end 
  
  def self.all 
    @@all 
  end 
  
end 