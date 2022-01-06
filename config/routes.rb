Rails.application.routes.draw do
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'

  resources :rooms, only: [:index, :show, :create]
  resources :posts, only: [:create]
end
