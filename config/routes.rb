Rails.application.routes.draw do
  devise_for :users
    root 'lectures#home'
    resources :lectures do
      member do
        get :reviews
        get 'reviews/new', to: 'reviews#new' # 新規レビューフォームの表示
        post 'reviews/create', to: 'reviews#create' # レビューレコードの作成
        get 'reviews/edit', to: 'reviews#edit' # レビュー編集フォームの表示
        patch 'reviews/update', to: 'reviews#update' # レビューレコードの更新
        delete 'reviews/destroy', to: 'reviews#destroy' # レビューレコードの削除
      end
    end

  namespace :users do
    get 'profile'
  end
end
