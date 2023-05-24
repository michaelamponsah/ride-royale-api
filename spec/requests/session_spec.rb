# spec/requests/sessions_spec.rb
require 'swagger_helper'

describe 'Sessions API' do
  path '/api/v1/users/sign_in' do
    get 'Gets a new session form' do
      tags 'Sessions'
      produces 'application/json'

      response '200', 'session form found' do
        run_test!
      end
    end
  end

  path '/api/v1/users/sign_in' do
    post 'Creates a new session' do
      tags 'Sessions'
      consumes 'application/json'
      parameter username: :session, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password username]
      }

      response '201', 'session created' do
        let(:session) { { username: 'newfoo', email: 'foo@bar.com', password: 'foobar' } }
        run_test!
      end

      response '401', 'invalid credentials' do
        let(:session) { { username: 'newfoo', email: 'foo@bar.com', password: 'bar' } }
        run_test!
      end
    end
  end
  path '/api/v1/users/sign_out' do
    delete 'Signs out the current user' do
      tags 'Sessions'

      response '200', 'user signed out' do
        run_test!
      end

      response '401', 'not logged in' do
        run_test!
      end
    end
  end
end
