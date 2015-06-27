Rails.application.routes.draw do
  resources :venues
  resources :beers
  resources :breweries

  root 'breweries#index'
end
