require 'pry'
# require_relative "./lib/scraper.rb"
# require_relative "./lib/cardset.rb"
require 'nokogiri'
require 'open-uri'

class Tarottogo::CLI 
  BASE_PATH = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
  
  def call 
    puts "Welcome to Tarot To Go:"
    list_cardsets
    cards 
    menu
  end 
  
  def list_cardsets
      puts " "
      puts "1. Major Arcana"
      puts "2. Wands"
      puts "3. Cups"
      puts "4. Swords"
      puts "5. Pentacles"
      puts " "
  end 
  
  def cards 
    cards_array = Tarottogo::Scraper.scrape_index(BASE_PATH + 'index.html')
    Tarottogo::Cardset.create_from_set(cards_array)
  end 
  
  def menu
    input = nil 
    while input != "exit"
      puts "Enter the number of the cardset you wish to see or type 'exit' to end:"
      input = gets.strip
      case input
      when "1"
        cards
      when "2"
        
      when "3"
        
      when "4"
        
      when "5"
        
      when "list"
        list_cardsets
      when "exit"
        goodbye
      else  
       error
      end 
    end
  end 
  
  def goodbye 
    puts "Until next time, Happy Reading!"
  end 
  
  def error
    puts "Please choose a cardset number 1-5, type 'list' to return to main menu, or 'exit' to exit the program:"
  end 
  
  
end 