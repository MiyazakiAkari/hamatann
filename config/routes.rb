Rails.application.routes.draw do
  devise_for :users
    root 'lectures#home'
    resources :lectures do
      member do
        get :review
      end
    end

  namespace :users do
    get 'profile'
  end
end
