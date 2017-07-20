Rails.application.routes.draw do

  get '/projects' => 'projects#index'
  get '/projects/new' => 'projects#new', as: 'new_project'
  get '/projects/:id' => 'projects#show', as: 'project'

  
  root "pages#home"

end
