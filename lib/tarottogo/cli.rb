require 'pry'
require 'nokogiri'
require 'open-uri'

class CLI 
  
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
  
  def make_cards(cardset_url)
    cards_array = Scraper.scrape_cardsets(cardset_url) 
    Tarot.create_from_cardset(cards_array)
  end 
  
  def menu
    input = nil 
    while input != 'exit'
      input = gets.strip
      case input
      when "1"
        puts " "
        make_cards('https://www.biddytarot.com/tarot-card-meanings/major-arcana/')
        Tarot.print_all
        puts " "
        next_choice
      when "2"
        puts " "
        make_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-wands/')
        Tarot.print_all
        puts " "
        next_choice
      when "3"
        puts " "
        make_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-cups/')
        Tarot.print_all
        puts " "
        next_choice
      when "4"
        puts " "
        make_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-swords/')
        Tarot.print_all
        puts " "
        next_choice
      when "5"
        puts " "
        make_cards('https://www.biddytarot.com/tarot-card-meanings/suit-of-pentacles/')
        Tarot.print_all
        puts " "
        next_choice
      when "list"
        Tarot.destroy
        list_cardsets
      when "exit"
        goodbye
      else  
       error
      end 
    end
  end 
  
  def display_card(input)
    card = Scraper.scrape_card_page(input)[0]
    puts "#{card[:name_keywords]}"
    puts "Upright: #{card[:upright]}"
    puts "Reversed: #{card[:reversed]}"
    puts " "
    puts "To return type 'list':"
  end 
  
  def next_choice
    puts "Enter the name for the card you wish to see or type 'list' to return to main menu."
    input = gets.strip
    if input == "list"
      Tarot.destroy
      list_cardsets
    elsif 
      input == "exit"
      goodbye
    elsif
      Scraper.scrape_card_page(input)
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