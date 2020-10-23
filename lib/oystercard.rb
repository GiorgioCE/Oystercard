class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

attr_reader :balance, :entry_station
  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)

fail ("Can't exceed 90") if amount + balance > MAXIMUM_BALANCE

  @balance += amount

  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    fail ("Insufficient funds #{MINIMUM_BALANCE}") if balance < MINIMUM_BALANCE
    @entry_station = station.name
    @status = "start"
  end

  def touch_out
    deduct(5)
    @entry_station = nil
    @status = "end"
  end

    private

    def deduct(amount)
      @balance -= amount
    end

end
