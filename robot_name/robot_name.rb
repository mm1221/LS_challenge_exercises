class Robot
  attr_accessor :name
  @@name_log = []
  
  def initialize
    @name = Robot.set_name
  end

  def self.set_name
    loop do
      letter_portion = Array.new(2){[*"A".."Z"].sample}.join
      number_portion = Array.new(3){[*"0".."9"].sample}.join
      @name = letter_portion + number_portion
      break unless @@name_log.include?(@name)
    end
    @@name_log << @name
    @name
  end

  def reset
    @name = Robot.set_name
  end
end