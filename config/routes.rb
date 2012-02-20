Bangarang::Application.routes.draw do
  root to: "welcomes#index"

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  resources :movies do
    collection do
      get 'search'
      get 'forceupdate'
    end
  end
  resources :albums do
    collection do
      get 'forceupdate'
    end
  end
  resources :servers do
    collection do
      get 'forceupdate'
      get 'status'
    end
  end
  resources :sessions
  resources :users do
    put :set_approved, on: :member
  end
end
