Rails.application.routes.draw do
  devise_for :users
  get '/welcome' => 'home#index'
  #root 'home#index'
  root 'products#index'

  resources :products do
    resources :variants, shallow: true
    collection do
      get :top
    end
    member do
      post :buy
    end
  end

  resource :profile, only: [:show, :edit, :update]

  #namespace :admin do
  #  #root "home#index"
  #  resource :products do
  #    resources :variants
  #  end
  #end

  concern :commentable do
    resources :comments
  end

  resources :message, concerns: :commentable
  resources :articles, concerns: :commentable
end
