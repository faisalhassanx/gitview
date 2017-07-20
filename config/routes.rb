Rails.application.routes.draw do

  get '/register', to: 'developers#new'
  resources :developers, except: [:new]
  
  resources :projects

  root "pages#home"

end
