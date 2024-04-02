Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tracks, only: [:index, :create, :destroy]
      resources :users, only: [:index, :create]


      post 'auth/login', to: "authentication#login"

    end
  end

  # root "posts#index"
end
