require 'pry'
class Tarottogo::CLI 
  
  def call 
    puts "Welcome to Tarot To Go:"
    list_cardsets
    menu
    goodbye
  end 
  
  def list_cardsets
    @cardset = Tarottogo::Tarot.card 
    @cardset.each.with_index(1) do |card, i|
      puts "#{i}. #{card.set}"
    end
  end 
  
  def menu
    input = nil 
    while input != "exit"
      puts "Enter number of the card set you wish to see or type 'list' to return to card set list or type 'exit' to end:"
      input = gets.strip
      
      if input.to_i > 0 
        the_cardset = @cardset[input.to_i-1] 
        puts "#{the_cardset.set}"
      elsif input == "list"
        list_cardsets
      else 
       puts "Please choose the number of a card set, type 'list' to return or exit:"
      end 
    end
  end 
  
  def goodbye 
    puts "Until next time, Happy Reading!"
  end 
  
  
  
  
end 