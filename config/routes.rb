Rails.application.routes.draw do
  root to: 'home#index'

  resource :home, only: [:show], controller: :home
  resources :select_repos, only: [:index]
  namespace :api, format: :json do
    resources :auth, only: [:create]
  end
end

