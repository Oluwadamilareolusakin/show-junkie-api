Rails.application.routes.draw do
  get 'users/new'

  get 'users/enquiries', to: 'enquiries#index'
  post 'users/:users_id/enquiries', to: 'enquiries#create'
  
  get '/shows/:show/comments', to: 'comments#index'
  post '/shows/:show/comments', to: 'comments#create'
  delete '/shows/:show/comments/:id', to: 'comments#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
