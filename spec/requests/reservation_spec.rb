# spec/requests/reservations_spec.rb
require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/users/:user_id/reservations' do
    get 'Gets a list of reservations for a user' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer

      response '200', 'reservations found' do
        let(:user_id) { 1 }
        run_test!
      end

      response '404', 'user not found' do
        let(:user_id) { 999 }
        run_test!
      end
    end

    post 'Creates a new reservation for a user' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          room_id: { type: :integer },
          start_date: { type: :date },
          end_date: { type: :date }
        },
        required: %w[room_id start_date end_date]
      }

      response '201', 'reservation created' do
        let(:reservation) { { room_id: 1, start_date: '2023-05-23', end_date: '2023-05-25' } }
        run_test!
      end

      response '400', 'invalid request' do
        let(:reservation) { { room_id: 1 } }
        run_test!
      end
    end
  end
end
