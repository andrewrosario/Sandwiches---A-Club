Rails.application.routes.draw do
  resources :sandwich_ingredients, only: [:new, :create, :edit, :update, :destroy]
  resources :ingredients
  resources :sandwiches
  resources :replies, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy, :show], param: :username
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/ingredients/search', to: 'ingredients#search'
  post '/sandwiches/search', to: 'sandwiches#search'
  
  root 'static#home', as: 'stranger_home'
  get '/home', to: 'users#home', as: 'home'
  get '/about', to: 'static#about', as: 'about'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/stats', to: 'application#stats', as: 'stats'
  post '/add_ingredient', to: 'sandwiches#add_ingredient', as: 'add_ingredient'

  get '/403', to: 'errors#forbidden', as: 'forbidden'
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#server_error'

  resources :photos

end
