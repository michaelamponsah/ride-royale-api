Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/create'
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
