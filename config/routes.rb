Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get   'inquiry'         => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'
  resources :stresses do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # ストレス発散ページ
  get "releases/eat" => "releases#eat"
  get "releases/buy" => "releases#buy"
  get "releases/travel" => "releases#travel"
  get "releases/listen" => "releases#listen"
  get "releases/watch" => "releases#watch"
  get "releases/laugh" => "releases#laugh"
  get "releases/cry" => "releases#cry"
  resources :releases, only: [:index]
  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end
  # 通知機能
  resources :notifications, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
