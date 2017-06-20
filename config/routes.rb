Rails.application.routes.draw do
  root "museums#index"

  namespace :api do
    namespace :v1 do
      resources :museums, only: [:index]
    end
  end

  devise_for :users,
    controllers: {
    sessions: 'users/sessions'
  }

  namespace :admin do
    resources :museums
    resources :reviews
  end

  resources :museums do
    resources :reviews
  end

  namespace :admin do
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :reviews, only: [] do
        resources :votes, only: [:create]
      end
    end
  end
end
