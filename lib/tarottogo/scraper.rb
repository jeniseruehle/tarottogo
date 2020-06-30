require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def self.scrape_cardsets(cardset_url)
    array = []
    cardset = Nokogiri::HTML(open(cardset_url))
    cards.css("div.class=cardboxwrapper").each do |cards|
      cardset_hash = {
        :set => cards.css('a').attribute('href').text,
        :cardset_url => "https://www.biddytarot.com/tarot-card-meanings#{cards.css('a').attr('href').text}"}
      array << cardset_hash
    end
  array
 end 
 
 def self.scrape_by_card(card_page)
   card = {}
   card_meaning = Nokogiri::HTML(open(card_page))
   meanings = card_meaning.css("")
 end 

end

