Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :museums
  root "museums#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  root "museums#index"
  
  resources :museums do
    resources :reviews
  end
>>>>>>> master
end
