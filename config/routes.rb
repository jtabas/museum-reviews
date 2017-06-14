Rails.application.routes.draw do
  root "museums#index"

  resources :museums do
    resources :reviews, only: :create
  end
end
