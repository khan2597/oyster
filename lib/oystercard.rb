class Oystercard
    attr_reader :balance
    attr_reader :location_history
    attr_reader :single_journey
    BALANCE_LIMIT = 90
    BALANCE_MIN = 1

    def initialize
        @balance = 0
        @in_journey = false
        @location_history = []
        @single_journey = {}
    end

    def top_up(amount)
        raise "Balance is over the limit of #{BALANCE_LIMIT}" if (@balance + amount) > BALANCE_LIMIT
        @balance += amount
    end

    def in_journey?
        return @in_journey
    end

    def touch_in(station)
        raise "You don't have enough" if @balance < BALANCE_MIN
        @single_journey.clear
        @in_journey = true
        @location_history << station
        @single_journey.merge!(entry_station: station)
    end

    def touch_out(station)
        deduct(BALANCE_MIN)
        @in_journey = false
        @location_history << station
        @single_journey.merge!(exit_station: station)
    end

    private
    
    def deduct(amount)
        @balance -= amount
    end
end