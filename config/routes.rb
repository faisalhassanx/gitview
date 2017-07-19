Rails.application.routes.draw do

  get '/projects' => 'projects#index'
  get '/projects/:id' => 'projects#show', as: 'project'
  
  root "pages#home"

end
