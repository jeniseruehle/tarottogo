require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Tarottogo::Scraper 
  
  def initialize(cards_url)
    @cards_url = cards_url
  end 
  
  def scrape 
    scrape_cardsets
  end 
  
  def scrape_cardsets
    array = []
    @html = Nokogiri::HTML(open(@cards_url))
    @html.search('div[class=cardboxwrapper]').each do |cardset|
      cardset_hash = {
        :set => cardset.search('a').attribute('href').value.split('/').join.gsub("-", " ").capitalize,
        :cardset_url => "https://www.biddytarot.com/tarot-card-meanings#{cardset.search('a').attr('href').text}"}
      array << cardset_hash
    end
  array
 end 
 
 def self.scrape_by_card(input)
   url = Tarottogo::Cardset.select_by_name(input)
   card_array = []
   html = Nokogiri::HTML(open(url))
   card_hash = {}
   
   card_hash[:name] = html.css('h4').text
   card_hash[:meaning] = html.css('h2')[3].text 
   
  # html.css('div.col.span_8 p').each do |m|
  #   if m.text.include?("UPRIGHT")
  #     card_hash[:upright] = m.text 
  #   elsif 
  #     m.text.include?("REVERSED")
  #     card_hash[:reversed] = m.text
  #   end
  # end 
   card_array << card_hash
   card_array
 end 

end

