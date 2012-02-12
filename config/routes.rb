Bangarang::Application.routes.draw do
  resources :movies

  resources :statuses

  root to: "welcomes#index"

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'status' => 'servers#status', as: 'status'
  get 'status_forceupdate' => 'servers#status_forceupdate', as: 'status_forceupdate'

  resources :servers
  resources :sessions
  resources :users do
    put :set_approved, on: :member
  end
end
