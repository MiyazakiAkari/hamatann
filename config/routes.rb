Rails.application.routes.draw do
  root to: 'lessons#index'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :lessons do
    resources :reviews
  end
end
