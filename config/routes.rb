Rails.application.routes.draw do
  resources :users
  root 'site#index'
  get '/howitworks', to: 'site#howitworks'
  get '/signup', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
