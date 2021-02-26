Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :beers
  get 'concept', to: 'pages#concept'
  get 'target', to: 'pages#target'
  get 'la_ptite_chopine', to: 'pages#la_ptite_chopine'
  get 'design_en_featuring', to: 'pages#design_en_featuring'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
