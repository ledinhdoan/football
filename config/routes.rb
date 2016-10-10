Rails.application.routes.draw do
  root "staticpage#index"

  get "/new_session", to: "sessions#new"
  post "/new_session", to: "sessions#create"
  delete "/delete_session", to: "sessions#destroy"
  resources :users , except: [:index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :clubs
  resources :players, only: [:index, :show]
  resources :scores
  resources :category_match_rates
  namespace :admin do
    resources :users
    resources :players
  end
  get "admin", to: "admin/welcome#home"
  delete "/delete_admin", to: "admin/users#destroy"
end
