Rails.application.routes.draw do
  root to: 'home#index'

  resource :home, only: [:show], controller: :home
  namespace :api, format: :json do
    resources :auth, only: [:create]
  end
end
