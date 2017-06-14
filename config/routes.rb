Rails.application.routes.draw do
  root "museums#index"

  resources :museums do
    resources :reviews
  end
end
