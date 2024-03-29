Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'feeds/index'
  resources :market_places do
    match '/scrape', to: 'market_places#scrape', via: :post, on: :collection
    collection do
      get :bars
      get :breweries
      get :caves
    end
  end
  get 'mail_alerts/new'
  get 'mail_alerts/create'
  resources :public_searches, only: [:new, :create, :show]
  devise_for :users
  root to: 'pages#home'
  resources :newsletters, only: [:new, :create]
  resources :users, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :accesses, only: [:new, :create, :show, :edit, :update]
  resources :feeds
  resources :stickers
  resources :publications do
    resources :answers
  end
  resources :projects
  resources :stores do
    resources :draftsets
  end

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
  resources :personal_messages, only: [:new, :create] do
    resources :mail_alerts, only: [:new, :create]
  end
  resources :conversations, only: [:index, :show]
  resources :designs
  resources :beers do
    member do
      post 'toggle_favorite', to: "beers#toggle_favorite"
    end
    collection {post :import }
    resources :tastings, only: [:create, :edit, :update]
    resources :fancies, only: [:create, :edit, :update]
    resources :ratings, only: [:create, :update]
    resources :tasting_places, only: [:index, :create, :edit, :update]
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
      get :white
      get :gold
      get :amber
      get :brown
      get :ruby
      get :black
      get :other
      get :alcohol_free
      get :light
      get :regular
      get :strong
      get :very_strong
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
