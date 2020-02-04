class Clock
  attr_accessor :total_minutes

  def initialize(total_minutes)
    @total_minutes = total_minutes
  end

  def self.at(hours,minutes = 0)
    hours_in_minutes = hours * 60
    hours_in_minutes = hours_in_minutes.to_f
    total_minutes = hours_in_minutes + minutes
    total_minutes = total_minutes.to_f
    the_time = Clock.new(total_minutes)
    the_time
  end

  def to_s
    @total_minutes -= 1440 if @total_minutes > 1339
    @total_minutes += 1440 if @total_minutes < 0
    round_down_hours = @total_minutes/60
    round_down_hours = round_down_hours.floor.to_i
    hours_in_minutes = round_down_hours * 60
    final_minutes = @total_minutes - hours_in_minutes
    final_minutes = final_minutes.to_i
    if round_down_hours < 10
      round_down_hours = '0' + round_down_hours.to_s
    else
      round_down_hours = round_down_hours.to_s
    end

    if final_minutes < 10
      final_minutes = '0' + final_minutes.to_s
    else
      final_minutes = final_minutes.to_s
    end
    "#{round_down_hours}:#{final_minutes}"
  end

  def +(add_minutes)
    self.total_minutes += add_minutes
    self.to_s
  end

  def -(subtract_minutes)
    self.total_minutes -= subtract_minutes
    self.to_s
  end

  def ==(clock2)
    self.total_minutes == clock2.total_minutes
  end
end