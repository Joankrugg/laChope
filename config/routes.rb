Rails.application.routes.draw do
  get 'ratings/create'
  get 'ratings/update'
  get 'fancies/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :designs

  resources :beers do
    resources :fancies, only: [:create, :update]
    resources :ratings, only: [:create, :update]
    resources :recipes
    collection do
      get :target
      get :spring
      get :autumn
      get :featuring
    end
  end
  get 'concept', to: 'pages#concept'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
