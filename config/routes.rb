Rails.application.routes.draw do

  post '/signup', to: 'users#create'
  post '/auth/login', to: 'authentication#authenticate'

  get '/enquiries', to: 'enquiries#index'
  post 'users/:user_id/enquiries', to: 'enquiries#create'

  get '/users/:user_id/favourites', to: 'favourites#index'
  post '/users/:user_id/favourites', to: 'favourites#create'
  delete '/users/:user_id/favourites/:id', to: 'favourites#destroy'

  get '/suggestions', to: 'suggestions#index'
  post '/users/:user_id/suggestions', to: 'suggestions#create'
  
  get '/shows/:show/comments', to: 'comments#index'
  post '/shows/:show/comments', to: 'comments#create'
  delete '/shows/:show/comments/:id', to: 'comments#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
