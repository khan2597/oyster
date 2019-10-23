require 'station'

describe Station do
    subject {Station.new("Kings Cross", 1)}

    it 'returns the name of the station' do
        expect(subject.name).to eq("Kings Cross")
    end

    it 'returns the zone of the station' do
        expect(subject.zone).to eq(1)
    end

    it 'creates an instance of the station class' do
        expect(subject).to be_an_instance_of(Station)
    end
end