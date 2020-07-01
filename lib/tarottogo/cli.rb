require 'pry'
require 'nokogiri'
require 'open-uri'

class Tarottogo::CLI 
  
  def call 
    list_cardsets
    menu
  end 
  
  def list_cardsets
      puts "Welcome to Tarot To Go:"
      puts " "
      puts "1. Major Arcana"
      puts "2. Wands"
      puts "3. Cups"
      puts "4. Swords"
      puts "5. Pentacles"
      puts " "
      puts "Enter the number of the cardset you wish to see or type 'exit' to end:"
  end 
  
  def menu
    input = nil 
    while input != 'exit'
      input = gets.strip
      case input
      when "1"
        create_cards('https://www.biddytarot.com/tarot-card-meanings/major-arcana/')
        Tarottogo::Tarot.print_all
        next_choice
      when "2"
        create_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-wands/')
        Tarottogo::Tarot.print_all
        next_choice
      when "3"
        create_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-cups/')
        Tarottogo::Tarot.print_all
        next_choice
      when "4"
        create_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-swords/')
        Tarottogo::Tarot.print_all
        next_choice
      when "5"
        create_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-pentacles/')
        Tarottogo::Tarot.print_all
        next_choice
      when "list"
        list_cardsets
      when "exit"
        goodbye
      else  
       error
      end 
    end
  end 
  
  def create_cards(cardset_url)
    card_array = Tarottogo::Scraper.new(cardset_url).scrape
    Tarottogo::Tarot.create_from_set(card_array)
  end 
  
  def display_card(input)
    card = Tarottogo::Scraper.scrape_card_page(input)[0]
    puts "#{card[:name]}"
    puts ""
  end 
  
  def next_choice
    puts "Enter the number for the cardset you wish to see or type 'list' to return to main menu."
    input = gets.strip
    if input == "list"
      list_cardsets
    elsif 
      input == "exit"
      goodbye
    elsif
      Tarottogo::Scraper.scrape_card_page(input)
      display_card(input)
    end 
  end 
  
  def goodbye 
    puts "Until next time, Happy Reading!"
  end 
  
  def error
    puts "Please choose a cardset number 1-5, type 'list' to return to main menu, or 'exit' to exit the program:"
  end 
  
  
end 