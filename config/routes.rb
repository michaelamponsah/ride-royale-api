Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

   #Redirect to api-docs
  get '*path', to: redirect('/api-docs')
  devise_for :users, defaults: { format: :json }, controllers: { sessions: 'api/v1/sessions' }

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
