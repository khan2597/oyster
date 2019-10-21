class Oystercard
    attr_reader :balance
    BALANCE_LIMIT = 90

    def initialize
        @balance = 0
    end

    def top_up(amount)
        raise "Balance is over the limit of #{BALANCE_LIMIT}" if (@balance + amount) > BALANCE_LIMIT
        @balance += amount
    end
end