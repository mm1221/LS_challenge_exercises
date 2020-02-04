class Scrabble
  attr_accessor :score
  def initialize(word)
    @word = word
    @score = 0
  end

  def score_it
    one_point = ["A","E","I","O","U","L","N","R","S","T"]
    two_point = ["D","G"]
    three_point = ["B","C","M","P"]
    four_point = ["F","H","V","W","Y"]
    five_point = ["K"]
    eight_point = ["J","X"]
    ten_point = ["Q","Z"]

    @word.split(//).each do |letter|
      score += 1 if one_point.include?(letter)
      score += 2 if two_point.include?(letter)
      score += 3 if three_point.include?(letter)
      score += 4 if four_point.include?(letter)
      score += 5 if five_point.include?(letter)
      score += 8 if eight_point.include?(letter)
      score += 10 if ten_point.include?(letter)
    end
  end
end

scrab = Scrabble.new('hello')