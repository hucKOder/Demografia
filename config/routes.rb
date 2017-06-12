Rails.application.routes.draw do

  get 'births/index'

  get 'deaths/index'

  get 'marriages/index'

  resources :towns
  resources :cantons
  resources :categories
  resources :migrations
  resources :years
  resources :addforms
  resources :edits

  get 'divorces', to: 'divorces#index'
  get 'searches', to: 'searches#index'
  get 'searches/data', :defaults => {:format => 'json'}
  
  root 'home_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
