require 'oystercard'

describe Oystercard do
    it 'creates istance of Oystercard' do 
        expect(subject).to be_an_instance_of(Oystercard)
    end

    it 'has a starting balance of 0' do
        expect(subject.balance).to be(0)
    end

    describe '#top_up' do
        it 'increases the balance on the card' do
            top_up_amount = rand(1..90)
            expect { subject.top_up(top_up_amount) }.to change{ subject.balance }.by top_up_amount
        end

        it 'raises an error if balance goes over £90' do
            expect { subject.top_up(95) }.to raise_error("Balance is over the limit of #{Oystercard::BALANCE_LIMIT}")
        end
    end

    describe '#deduct' do
        it 'deducts the amount from the balance' do
            subject.top_up(50)
            deduct_amount = 20
            expect { subject.deduct(deduct_amount) }.to change{ subject.balance }.by -(deduct_amount)
        end
    end

    it 'checks that in_journey is set to false to start' do
        expect(subject.in_journey?).to be false
    end

    it 'sets the user to be in journey' do
        subject.touch_in
        expect(subject.in_journey?).to be true
    end

    it 'sets user to not be in journey' do
        subject.touch_out
        expect(subject.in_journey?).to be false
    end

    it 'allows the user to touch in' do
        expect(subject).to respond_to(:touch_in)
    end

    it 'allows the user to touch out' do
        expect(subject).to respond_to(:touch_out)
    end
end