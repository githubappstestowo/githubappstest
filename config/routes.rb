Rails.application.routes.draw do
  root to: 'home#index'
 # ddd
  resource :installations, only: [:new]
  resource :callback, only: [:show], controller: :callback
  resource :githubapp_auth, only: [:create], controller: :githubapp_auth
  resources :select_repos, only: [:index]
  resources :users, only: [:destroy]
  namespace :api, format: :json do
    resources :webhook, only: [:create]
  end
end

