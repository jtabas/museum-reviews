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
    resources :reviews, only: [:destroy]
    resources :users, only: [:index, :show]
  end

  resources :users, except: [:index, :new, :create]
  resources :museums, only: [:index, :show] do
    resources :reviews, except: [:index, :show]
  end

  namespace :api do
    namespace :v1 do
      resources :reviews, only: [] do
        resources :votes, only: [:create]
      end
    end
  end
end
