Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  match '/users',   to: 'users#index',   via: 'get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "tweets#index"
  resources :tweets
end
