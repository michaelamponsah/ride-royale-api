require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
    before :all do
        @user = User.create(username: 'test')
        @car = Car.create( id: 1, model: 'BMW', picture: 'picture link', price: 250, user_id: @user.id)    
    end
    
    describe 'POST create' do
        it 'returns status 201' do
            post :create, params: {user_id: @user.id, reservation: { car_id: @car.id, city: 'test', date: '2022-09-04' } }
          expect(response.status).to eq(201)
        end
    end    
end