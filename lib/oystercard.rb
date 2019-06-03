class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance


  def initialize
    @balance = 0
  end

  def top_up(value)
    @balance += value

    fail 'Maximum balance exceeded' if value + @balance > MAX_BALANCE


  end
end
