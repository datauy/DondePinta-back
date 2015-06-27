Rails.application.routes.draw do
  resources :beers
  resources :breweries

  root 'breweries#index'
end
