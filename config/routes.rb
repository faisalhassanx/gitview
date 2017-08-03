Rails.application.routes.draw do

  resources :messages, only: [:create]
  
  get 'gitchat', to: 'chatrooms#show'
  
  mount ActionCable.server => '/cable'

  resources :types, only: [:new, :create, :show]
 
  resources :technologies, only: [:new, :create, :show]
  
  get '/register', to: 'developers#new'
  get   '/login',    to: "sessions#new"
  post  '/login',    to: "sessions#create"
  get   '/logout',   to: "sessions#destroy"
  
  resources :developers, except: [:new]
  
  resources :projects do
    resources :comments, only: [:create]
  end
  
  get '/about', to: 'pages#about'
  root "pages#home"

end
