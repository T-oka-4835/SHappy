Rails.application.routes.draw do
  get 'releases/index'
  devise_for :users
  root "homes#top"
  resources :stresses do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get "releases/eat" => "releases#eat"
  get "releases/buy" => "releases#buy"
  get "releases/travel" => "releases#travel"
  get "releases/listen" => "releases#listen"
  get "releases/watch" => "releases#watch"
  get "releases/laugh" => "releases#laugh"
  get "releases/cry" => "releases#cry"
  resources :releases, only: [:index]
  resources :events, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
