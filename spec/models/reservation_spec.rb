require 'rails_helper'

RSpec.describe Reservation, type: :model do
    subject { Reservation.new(user_id: 1, car_id: 1, city: 'Herat', date: '2023-5-16') }

    before { subject.save }

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a user_id' do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a car_id' do
        subject.car_id = nil
        expect(subject).to_not be_valid
    end

    it 'it should have a city "Herat"' do
        expect(subject.city).to eq('Herat')
    end

    it 'it should have user_id "1"' do
        expect(subject.user_id).to eq(1)
    end
end