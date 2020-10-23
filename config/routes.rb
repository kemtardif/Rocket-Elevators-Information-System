Rails.application.routes.draw do
  devise_for :employees
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  mount Blazer::Engine, at: "blazer"
  
  root 'home#index'

  get 'home/index', to: 'home#index'
  get 'home/residential', to: 'home#residential'
  get 'home/commercial', to: 'home#commercial'
  get 'home/terms', to: 'home#terms', as: 'terms'

  get 'quotes/new', to: 'quotes#new', as: 'quote'
  # get 'welcome/terms', to: 'welcome#terms', as: 'terms'

  get 'leads', to: 'leads#new'
  post '', to: 'leads#create'

  resources :quotes

  resources :leads



end
