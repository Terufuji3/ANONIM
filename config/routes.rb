Rails.application.routes.draw do
  #get 'rooms/index'
  #get '/rooms/:id', to: 'rooms#show'
  #post '/rooms', to: 'rooms#create'

  resources :rooms, only: [:index, :show, :create]
  resources :posts, only: [:create]
end
