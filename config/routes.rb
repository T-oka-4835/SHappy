Rails.application.routes.draw do
  get 'releases/index'
  devise_for :users
  root "homes#top"
  resources :stresses
  resources :users, only: [:show, :edit, :update]
  get "releases/eat", "releases#eat"
  get "releases/buy", "releases#buy"
  get "releases/travel", "releases#travel"
  get "releases/listen", "releases#listen"
  get "releases/watch", "releases#watch"
  get "releases/laugh", "releases#laugh"
  get "releases/cry", "releases#cry"
  resources :releases, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
