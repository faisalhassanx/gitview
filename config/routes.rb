Rails.application.routes.draw do

  get '/register', to: 'developers#new'
  get   '/login',    to: "sessions#new"
  post  '/login',    to: "sessions#create"
  get   '/logout',   to: "sessions#destroy"
  
  resources :developers, except: [:new]
  
  resources :projects

  root "pages#home"

end
