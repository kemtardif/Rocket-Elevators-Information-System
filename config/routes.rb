Rails.application.routes.draw do
  devise_for :employees
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  root 'home#index'
  get 'home/index', to: 'home#index'
  get 'home/residential', to: 'home#residential'
  get '/home/commercial'
  get 'quotes/new', to: 'quotes#new', as: 'quote'
  get 'welcome/terms', to: 'welcome#terms', as: 'terms'
  
  resources :quotes


end
