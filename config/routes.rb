Rails.application.routes.draw do

  get '/projects' => 'projects#index'
  
  root "pages#home"

end
