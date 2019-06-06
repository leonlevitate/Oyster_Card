class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :in_use, :MIN_BALANCE, :MAX_BALANCE, :entry_station, :exit_station


  def initialize
    @balance = 0
    # @in_use = false
  end

  def top_up(value)
    fail "Maximum balance of #{MAX_BALANCE} exceeded" if value + @balance > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    # @in_use
    @entry_station
  end

  def touch_in(entry_station)
    fail "Your balance is below £1. Please top up" if @balance < MIN_BALANCE
    @in_use = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    @in_use = false
    @entry_station = nil
    @exit_station = exit_station
  end

private

  def deduct(value)
    @balance -= value
  end
end
