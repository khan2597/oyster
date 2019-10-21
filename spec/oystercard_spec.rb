require 'oystercard'

describe Oystercard do
    it 'creates istance of Oystercard' do 
        expect(subject).to be_an_instance_of(Oystercard)
    end

    it 'has a starting balance of 0' do
        expect(subject.balance).to be(0)
    end
end