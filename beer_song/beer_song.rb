class BeerSong
  attr_accessor :verse_count
  def initialize
    @verse_count = 99
  end

  def verse(verse_count)
    #@verse_count = verse_count
    string = " "
    if @verse_count == 1
      string = "#{@verse_count} bottle of beer on the wall, #{@verse_count} bottles of beer.\n"\
               "Take it down and pass it around, no more bottles of beer on the wall.\n"
               
    elsif @verse_count == 2
      string = "#{@verse_count} bottles of beer on the wall, 2 bottles of beer.\n"\
               "Take one down and pass it around, #{@verse_count - 1} bottle of beer on the wall.\n"
               
    elsif @verse_count == 0
      string = "No more bottles of beer on the wall, no more bottles of beer.\n"
               "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
               
    else
      string =  "#{@verse_count} bottles of beer on the wall, 99 bottles of beer.\n"\ 
      "Take one down and pass it around, #{@verse_count - 1} bottles of beer on the wall.\n"
                
    end
    string
  end

  def verses(verse1,verse2)
    self.verse(verse1)
    self.verse(verse2)
  end

  def lyrics
    loop do
      verse(@verse_count)
      @verse_count -= 1
      #puts " verse count is #{@verse_count}"
      break if @verse_count == -1
    end
  end
end