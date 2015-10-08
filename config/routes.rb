Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :breweries, only: [:index, :show]
      resources :venues, only: [:index, :show]
      resources :beers, only: [:index, :show]
    end
  end

  resources :venues, except: [:new, :show]
  resources :beers, except: [:new, :show]
  resources :breweries, except: [:new, :show]

  root 'breweries#index'
end
