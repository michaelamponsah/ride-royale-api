Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: { sessions: 'api/v1/sessions' }

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] do
      resources :reservations, only: [:index, :create, :destroy, :show]
    end
  end
  end

  #Car resource  endpoint
  namespace :api do
    namespace :v1 do
      resources :cars do
        get 'user_cars', on: :collection
        delete 'delete', on: :member
      end
    end
  end
end
