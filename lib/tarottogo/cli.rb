require 'pry'
class CLI 
  
  def call 
    puts "Welcome to Tarot To Go:"
    list_cardsets
    menu
    goodbye
  end 
  
  def list_cardsets
    @cardset = Scraper.card 
    @cardset.each do |card|
      puts " "
      puts "1. #{card.set_1}"
      puts "2. #{card.set_2}"
      puts "3. #{card.set_3}"
      puts "4. #{card.set_4}"
      puts "5. #{card.set_5}"
      puts " "
    end
  end 
  
  def menu
    input = nil 
    while input != "exit"
      puts "Enter the number of the cardset you wish to see or type 'exit' to end:"
      input = gets.strip
      case input
      when "1"
        
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