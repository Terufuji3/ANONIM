Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'

  resources :rooms, only: [:index, :show, :create, :new] do
    member do
      get :confirmation
      post :password_check
    end
  end
  resources :posts, only: [:create]
  resources :users, only: [:show]
  resources :room_bookmarks, only: [:create, :destroy]
end
