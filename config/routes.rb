Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :beers do
    resources :recipes
    collection do
      get :target
      get :spring
      get :autumn
      get :featuring
    end
  end
  get 'concept', to: 'pages#concept'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
