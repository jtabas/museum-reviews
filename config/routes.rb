Rails.application.routes.draw do
<<<<<<< HEAD
  root "museums#index"

  namespace :api do
    namespace :v1 do
      resources :museums, only: [:index]
    end
  end

  resources :museums do
=======
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'museums#index'
  namespace :admin do
    resources :museums
>>>>>>> master
    resources :reviews
  end

  resources :museums do
    resources :reviews, only: :create
  end
end
