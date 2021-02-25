Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :beers
  get 'concept', to: 'pages#concept'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
