require 'rails_helper'

RSpec.describe Car, type: :model do
  before :each do
    @user = User.new(username: 'berna')
    @user.save
  end

  context 'validation tests' do
    it 'ensures model presence' do
      car = Car.new(user_id: @user.id, make: 'nework', picture: 'new', price: 2000).save
      expect(car).to eq(false)
    end

    it 'ensures make presence' do
      car = Car.new(user_id: @user.id, model: 'model', picture: 'new', price: 2000).save
      expect(car).to eq(false)
    end
    it 'ensures picture presence' do
      car = Car.new(user_id: @user.id, model: 'model', make: 'nework', price: 2000).save
      expect(car).to eq(false)
    end
    it 'ensures price presence' do
      car = Car.new(user_id: @user.id, model: 'model', make: 'nework', picture: 'new').save
      expect(car).to eq(false)
    end
    it 'ensures price to be positive number' do
      car = Car.new(user_id: @user.id, model: 'model', make: 'nework', picture: 'new', price: 1).save
      expect(car).to eq(true)
    end
    it 'ensures price to be not to be negative number' do
      car = Car.new(user_id: @user.id, model: 'model', make: 'nework', picture: 'new', price: -1).save
      expect(car).to eq(false)
    end
  end
end
