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

