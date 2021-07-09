Rails.application.routes.draw do
  resources :public_searches, only: [:new, :create, :show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :stickers
  resources :projects
  resources :stores
  resources :typical_beers do
    collection do
      get :wheat_beers
      get :lambics
      get :belgian_ales
      get :pale_ales
      get :bitters
      get :scottish_ales
      get :brown_ales
      get :porters
      get :stouts
      get :pilsners
      get :american_lagers
      get :european_lagers
      get :bocks
      get :alts
      get :french_ales
      get :german_ambers
      get :american_specials
      get :smoked_beers
      get :strong_ales
    end
  end
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]
  resources :designs
  resources :beers do
    resources :tastings, only: [:create, :edit, :update]
    resources :fancies, only: [:create, :edit, :update]
    resources :ratings, only: [:create, :update]
    resources :recipes
    collection do
      get :target
      get :lagers
      get :spontaneous
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
  resources :searches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
