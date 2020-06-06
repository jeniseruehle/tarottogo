class Tarottogo::Tarot 
attr_accessor :set, :card, :meaning, :url 
  def self.card
    puts " "
    puts <<-DOC
    1. Major Arcana
    2. Wands 
    3. Cups 
    4. Swords 
    5. Pentacles
   DOC
    puts " "
    cardset_1 = Tarot.new 
    cardset_1.set = "Major Arcana"
    cardset_1.card = "Card Name"
    cardset_1.meaning = "Description"
    cardset_1.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    cardset_2 = Tarot.new 
    cardset_2.set = "Wands"
    cardset_2.card = "Card Name"
    cardset_2.meaning = "Description"
    cardset_2.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    cardset_3 = Tarot.new 
    cardset_3.set = "Cups"
    cardset_3.card = "Card Name"
    cardset_3.meaning = "Description"
    cardset_3.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    cardset_4 = Tarot.new 
    cardset_4.set = "Swords"
    cardset_4.card = "Card Name"
    cardset_4.meaning = "Description"
    cardset_4.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    cardset_5 = Tarot.new 
    cardset_5.set = "Pentacles"
    cardset_5.card = "Card Name"
    cardset_5.meaning = "Description"
    cardset_5.url = "https://labyrinthos.co/blogs/tarot-card-meanings-list"
    
    [cardset_1, cardset_2, cardset_3, cardset_4, cardset_5]
  end 
end 