class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

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
    fail ("Insufficient funds #{MINIMUM_BALANCE}") if balance < MINIMUM_BALANCE
  @status = "start"
  end

  def touch_out
    deduct(5)
    @status = "end"
  end

end
