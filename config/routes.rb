Rails.application.routes.draw do
  
  resources :searches
  resources :towns
  resources :cantons

  root 'home_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
