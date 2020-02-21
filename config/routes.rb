Rails.application.routes.draw do
  resources :versions
  resources :songs
  resources :collections
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
