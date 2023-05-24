Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

   #Redirect to api-docs
  # get '*path', to: redirect('/api-docs')

  # Login and register paths
  # post 'api/v1/register/:username/:email', to: 'users#register'
  # get 'api/v1/login/:username', to: 'users#login'
  post 'register/:username/:email', to: 'users#register'
  get 'login/:username', to: 'users#login'

  # post '/users/register', to: 'users#register'
  # post '/users/login', to: 'users#login'

  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :create, :destroy, :show] do
        member do
          delete :delete
        end

        collection do
          get :user_cars
        end
      end
      resources :users, only: [:index, :create] do
        resources :reservations, only: [:index, :create, :destroy, :show]
      end
    end
  end
end
