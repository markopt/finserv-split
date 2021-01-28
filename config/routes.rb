Rails.application.routes.draw do
  get '/auto', to: 'auto#index'

  get '/mortgages', to: 'mortgages#index'

  get '/cards', to: 'cards#index'
  get '/banking', to: 'banking#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/apply', to: 'cards#apply'
  get 'offers/index'
  post '/optimizely-webhook', to: 'application#update_optimizely'
  get 'welcome/index'
  root 'welcome#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
