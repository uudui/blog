require 'sidekiq/web'

Blog::Application.routes.draw do
  root 'posts#index'
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users, :only => [:new, :create, :show]
  resources :sessions, :only => [:create]
  resources :password_resets, :only => [:new, :create, :edit, :update]

  namespace :settings do
    resource :password, only: [:show, :update]
    resource :profile, only: [:show, :update]
  end

  namespace :admin do
    root to: 'dashboard#index'

    resources :users, only: [:index, :show, :update, :destroy] do
      collection do
        get :locked
      end
    end
  end


  resources :posts, :only => [:index, :new, :create, :edit, :update, :show] do
    resources :likes, :only => [:create, :destroy]
    resources :unlikes, :only => [:create, :destroy]
    resources :comments, :only => [:create, :update, :destroy]
    collection do
      get :check
    end

    member do
      get :check_up
      get :check_down
      get :check_next
    end

  end

  mount Sidekiq::Web => '/sidekiq'
end
