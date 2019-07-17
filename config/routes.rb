Rails.application.routes.draw do
  root 'events#home'
  get  '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  get  '/signin',  to: 'sessions#new'
  post  '/signin',  to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  resources :users do
    resources :events, only: [:show, :new ,:create]
  end
  resources :events , only: [:show, :update]
end
