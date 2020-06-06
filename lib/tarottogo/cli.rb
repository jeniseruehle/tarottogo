# CLI Controller
class Tarottogo::CLI 
  
  def call 
    puts "Welcome to Tarot To Go:"
    list_cardsets
    menu
    goodbye
  end 
  
  def list_cardsets
    @cardset = Tarottogo::Tarot.card 
  end 
  
  def menu
    input = nil 
    while input != "exit"
      puts "Enter number of the card set you wish to see or type 'list' to return to card set list or type 'exit' to end:"
      input = gets.strip
      case input 
      when "1"
        puts "Major Arcana"
      when "2"
        puts "Wands"
      when "3"
        puts "Cups"
      when "4" 
        puts "Swords"
      when "5"
        puts "Pentacles"
      when "list"
        list_cardsets
      #else 
        #"Please choose the number of a card set, type 'list' to return to cardsets or exit:"
      end 
    end
  end 
  
  def goodbye 
    puts "Until next time, Happy Reading!"
  end 
  
  
  
  
end 