Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :beers do
    collection do
      get :target
      get :la_ptite_chopine
      get :design_en_featuring
    end
  end
  get 'concept', to: 'pages#concept'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
