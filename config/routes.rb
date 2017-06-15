Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'museums#index'
  namespace :admin do
    resources :museums
    resources :reviews
  end

  resources :museums do
    resources :reviews, only: :create
  end
end
