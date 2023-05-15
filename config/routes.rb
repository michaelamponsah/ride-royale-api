Rails.application.routes.draw do
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
      
      resources :user, only: [:index, :create] do
      resources :reservations, only: [:index, :create, :destroy, :show]
    end
  end
end
end
