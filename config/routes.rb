Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'

  resources :rooms, only: [:index, :show, :create, :new]
  resources :posts, only: [:create]
  resources :users, only: [:show]
end
