Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :versions, only: [:create, :update, :destroy]
      resources :songs, only: [:show, :create, :update, :destroy]
      resources :collections, only: [:create, :update, :destroy]
      resources :users, only: [:create, :show, :destroy]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
