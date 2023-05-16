Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] do
      resources :reservations, only: [:index, :create, :destroy, :show]
    end
  end
end
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #cars end point
  namespace :api do
    namespace :v1 do
      resources :cars do
        get 'user_cars', on: :collection
        delete 'delete', on: :member
      end
    end
  end
end

# post 'login', to: 'authentication#login'
