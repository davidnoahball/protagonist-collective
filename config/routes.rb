Rails.application.routes.draw do
  root 'site#index'
  get '/howitworks', to: 'site#howitworks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
