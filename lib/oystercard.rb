class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :in_use


  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    fail "Maximum balance of #{MAX_BALANCE} exceeded" if value + @balance > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_use
  end

  def touch_in
    @in_use = true
    fail "Your balance is below £1. Please top up" if @balance < MIN_BALANCE
  end

  def touch_out
    @in_use = false
  end
end
