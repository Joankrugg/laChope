Rails.application.routes.draw do
  get 'feeds/index'
  resources :market_places, path: 'points-de-vente' do
    match '/scrape', to: 'market_places#scrape', via: :post, on: :collection
    collection do
      get :bars
      get :breweries, path: 'brasseries'
      get :caves
    end
  end
  get 'mail_alerts/new'
  get 'mail_alerts/create'
  resources :public_searches, path: 'recherches-de-bieres', only: [:new, :create, :show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :newsletters, only: [:new, :create]
  resources :users, path: 'communaute', only: [:index, :create, :show, :edit, :update, :destroy]
  resources :accesses, only: [:new, :create, :show, :edit, :update]
  resources :feeds, path: 'photos'
  resources :stickers, path: 'etiquettes'
  resources :publications do
    resources :answers
  end
  resources :projects, path: 'projets'
  resources :stores, path: 'caves-à-bière' do
    resources :draftsets
  end

  resources :typical_beers, path: 'familles-de-bieres' do
    collection do
      get :wheat_beers, path: 'bieres-de-ble'
      get :lambics
      get :belgian_ales, path: 'ales-belges'
      get :pale_ales
      get :bitters
      get :scottish_ales, path: 'ales-ecossaises'
      get :brown_ales
      get :porters
      get :stouts
      get :pilsners
      get :american_lagers, path: 'lagers-americaines'
      get :european_lagers, path: 'lagers-européennes'
      get :bocks
      get :alts, path: 'altbiers'
      get :french_ales, path: 'ales-françaises'
      get :german_ambers, path: 'ambrees-allemandes'
      get :american_specials, path: 'americaines-speciales'
      get :smoked_beers, path: 'americaines-speciales'
      get :strong_ales, path: 'ales-fortes'
    end
  end
  resources :personal_messages, path: 'messages-perso', only: [:new, :create] do
    resources :mail_alerts, only: [:new, :create]
  end
  resources :conversations, only: [:index, :show]
  resources :designs
  resources :beers, path: 'bieres' do
    collection {post :import }
    resources :tastings, only: [:create, :edit, :update]
    resources :fancies, only: [:create, :edit, :update]
    resources :ratings, only: [:create, :update]
    resources :tasting_places, only: [:index, :create, :edit, :update]
    resources :recipes
    collection do
      get :target, path: 'target-bieres'
      get :lagers
      get :spontaneous, path: 'fermentations-spontanees'
      get :ales
      get :mixed, path: 'fermentations-mixtes'
      get :spring
      get :autumn
      get :featuring
      get :white, path: 'blanches'
      get :gold, path: 'blondes'
      get :amber, path: 'ambrees'
      get :brown, path: 'brunes'
      get :ruby, path: 'rouges'
      get :black, path: 'noires'
      get :alcohol_free, path: 'sans-alcool'
      get :light, path: 'legeres'
      get :regular, path: 'classiques'
      get :strong, path: 'fortes'
      get :very_strong, path: 'tres-fortes'
    end
  end
  get 'concept', to: 'pages#concept'
    resources :articles do
      collection do
      get :history, path: 'histoire'
      get :actu, path: 'actualites'
      get :note_of_intent, path: 'intentions'
      get :science, path: 'technique&biologie'
    end
  end
  resources :searches, path: 'recherches'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
