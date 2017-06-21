Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'museums#index'

  resources :museums do
    resources :reviews
  end

  namespace :admin do
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :museums do
        resources :reviews, only: [] do
          resources :votes, only: [:create]
        end
      end
    end
  end
end
