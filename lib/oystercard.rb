class Oystercard

MAXIMUM_BALANCE = 90

attr_reader :balance, :state
  def initialize
    @balance = 0

  end

  def top_up(amount)

fail ("Can't exceed 90") if amount + balance > MAXIMUM_BALANCE

  @balance += amount

  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @state
  end

  def touch_in
  @status = "start"
  end

  def touch_out
    @status = "end"
  end

end
