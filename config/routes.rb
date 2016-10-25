Rails.application.routes.draw do

  resources :sessions, only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/test', to: 'application#test'
  get '(*path)', to: 'application#angular', constraints: lambda { |req| req.format == :html }

  resources :bookmarks, only:[:create, :delete]
  resources :adventures, only: [:show, :index, :new] do
    resources :pages, only: [:show, :edit, :new, :create, :update]
    resources :bookmarks, only:[:index]
  end
  resources :users
  #resources :pages

  root to: 'application#angular'
  get '/howitworks', to: 'site#howitworks'
  get '/login', to: 'users#login'
  post '/logout', to: 'sessions#destroy', as: 'signout'
  post '/adventures/:adventure_id/pages/new', to: 'pages#create'
  post '/adventures', to: 'adventures#create'

  resources :sessions, only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end