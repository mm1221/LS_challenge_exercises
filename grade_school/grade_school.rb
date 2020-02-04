class School
  attr_accessor :grades_hash
  def initialize
    @grades_hash = {}
  end

  def add(name,grade)
    if @grades_hash[grade] == nil
     @grades_hash[grade] = [name]
    else
     @grades_hash[grade] << name
     @grades_hash[grade].sort!
     #@grades_hash.sort_by {|k,v| k}
    end
  end

  def grade(num)
    if @grades_hash[num] == nil
      []
    else
      @grades_hash[num]
    end
  end

  def to_h
   @grades_hash.sort_by {|k,v| k}.to_h
  end
end