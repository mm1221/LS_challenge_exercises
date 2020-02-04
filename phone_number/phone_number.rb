class PhoneNumber
  attr_accessor :area_code
  
  def initialize(raw_number)
    @raw_number = raw_number
    #@number = nil
    @area_code = nil
  end

  def number
    digit_count = @raw_number.count('0123456789')
    only_digits = @raw_number.gsub(/[^0-9,.]/, "")

    if digit_count < 10 || digit_count > 11 || @raw_number.count("a-zA-Z") > 0
      '0000000000'
    elsif @raw_number.size == 11 && @raw_number[0] != '1'
      '0000000000'
    elsif digit_count == 11 && only_digits[0] == '1'
      @raw_number = @raw_number[1..-1]
      self.number
    else
      num = @raw_number.tr('^0-9', '')
      @area_code = num[0..2]
      num   
    end
  end

  def area_code
    self.number
    @area_code
  end

  def to_s
    num = self.number
    str = "(#{num[0..2]}) #{num[3..5]}-#{num[6..9]}"
    str
  end
end




number = PhoneNumber.new('21234567890')