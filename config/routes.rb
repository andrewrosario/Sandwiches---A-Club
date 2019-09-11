Rails.application.routes.draw do
  resources :sandwich_ingredients, only: [:new, :create, :edit, :update, :destroy]
  resources :ingredients
  resources :sandwiches
  resources :replies, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :destroy, :show], param: :username
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/ingredients/search', to: 'ingredients#search'
  post '/sandwiches/search', to: 'sandwiches#search'
  
  root 'static#home'
  get '/home', to: 'users#home', as: 'home'
  get '/about', to: 'static#about', as: 'about'

  get '/stats', to: 'application#stats', as: 'stats'
  post '/add_ingredient', to: 'sandwiches#add_ingredient', as: 'add_ingredient'

  resources :photos

end
