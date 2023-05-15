require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  before :all do
    @user = User.create(username: 'testing')
    @car = Car.create(user_id: @user.id, make: 'nework', model: 'new', picture: 'new', price: 2000)
  end

  describe 'POST create car' do
    it 'returns status 201 (created)' do
      post :create,
           params: { car: { user_id: @user.id, make: 'nework', model: 'new', picture: 'new', price: 2000 } }
      expect(response.status).to eq(201)
    end

    it 'returns status 500 (internal_server_error) ' do
      post :create,
           params: { car: { user_id: @user.id, model: 'new', picture: 'new', price: 2000 } }
      expect(response.status).to eq(500)
    end
  end

  describe 'GET index' do
    it 'returns cars array' do
      get :index
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_empty
    end
  end
end
