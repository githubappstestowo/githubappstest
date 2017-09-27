Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api, format: :json do
    resources :auth, only: [:create]
  end
end
