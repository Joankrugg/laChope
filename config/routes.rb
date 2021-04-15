Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]
  resources :designs
  resources :beers do
    resources :tastings, only: [:create, :edit, :update]
    resources :fancies, only: [:create, :update]
    resources :ratings, only: [:create, :update]
    resources :recipes
    collection do
      get :target
      get :lagers
      get :ales
      get :mixed
      get :spring
      get :autumn
      get :featuring
    end
  end
  get 'concept', to: 'pages#concept'
    resources :articles do
      collection do
      get :history
      get :actu
      get :note_of_intent
      get :science
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
