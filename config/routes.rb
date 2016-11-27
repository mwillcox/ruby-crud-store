Rails.application.routes.draw do
  get '/', to: 'products#index'
  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new', as: 'test'
  get '/products/:id', to: 'products#show'
  post '/products', to: 'products#create'
  get '/products/:id/edit', to: 'products#edit'
  patch '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#destroy'
  post '/products/search', to: 'products#search'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


end
