class Oystercard
    attr_reader :balance
    BALANCE_LIMIT = 90

    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(amount)
        raise "Balance is over the limit of #{BALANCE_LIMIT}" if (@balance + amount) > BALANCE_LIMIT
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        return @in_journey
    end

    def touch_in
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end
end