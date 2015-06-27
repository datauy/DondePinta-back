Rails.application.routes.draw do
  resources :breweries

  root 'breweries#index'
end
