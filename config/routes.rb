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

  resources :users, except: [:index, :new, :create]
  resources :museums , only: [:index] do
    resources :reviews, except: [:index]
  end
end
