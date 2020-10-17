Rails.application.routes.draw do
  devise_for :employees
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  root 'home#index'
  get 'home/residential', to: 'home#residential'
  get '/home/commercial'
  get 'quotes/new', to: 'quotes#new', as: 'quote'
  get 'home/terms', to: 'home#terms', as: 'terms'
  resources :quotes


end
