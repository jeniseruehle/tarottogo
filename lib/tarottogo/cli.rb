require 'pry'
require 'nokogiri'
require 'open-uri'

class Tarottogo::CLI 
  
  def call 
    puts "Welcome to Tarot To Go:"
    list_cardsets
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
      puts "Enter the number of the cardset you wish to see or type 'exit' to end:"
  end 
  
  def list_cards(cards_url)
    card_array = Tarottogo::Scraper.new(cards_url).scrape
    Tarottogo::Cardset.create_from_set(card_array)
  end 
  
  def menu
    input = nil 
    while input != 'exit'
      input = gets.strip
      case input
      when "1"
        list_cards('https://www.biddytarot.com/tarot-card-meanings/major-arcana/')
        Tarottogo::Cardset.print_all
      when "2"
        list_cards('https://www.biddytarot.com/tarot-card-meanings/minor-arcana/suit-of-wands/')
        Tarottogo::Cardset.print_all
      when "3"
        list_cards('https://www.biddytarot.com/tarot-card-meanings/minor-arcana/suit-of-cups/')
        Tarottogo::Cardset.print_all
      when "4"
        list_cards('https://www.biddytarot.com/tarot-card-meanings/minor-arcana/suit-of-swords/')
        Tarottogo::Cardset.print_all
      when "5"
        list_cards('https://www.biddytarot.com/tarot-card-meanings/minor-arcana/suit-of-pentacles/')
        Tarottogo::Cardset.print_all
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
  
  def display_card(input)
    card = Tarottogo::Scraper.scrape_by_card(input)[0]
    puts "#{card[:name]}"
    puts "#{card[:upright]}"
    puts "#{card[:reversed]}"
  end 
  
end 