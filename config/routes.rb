Bangarang::Application.routes.draw do
  resources :statuses

  root to: "welcomes#index"

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'status' => 'servers#status'

  resources :servers do
  	resources :statuses
  end
  resources :sessions
  resources :users do
    put :set_approved, on: :member
  end
end