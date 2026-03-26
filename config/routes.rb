Rails.application.routes.draw do

  resources :carts, only: [:show, :index] do
  # セッションカートに商品を追加、数量を更新、商品を削除するアクション
    collection do
      post :add_product  # カートに商品を追加
    end
    member do
      delete :remove_item  # カートから商品を削除
      post :update_quantity  # カート内の商品数を変更
    end
  end

  # ユーザーのカート内の商品操作
  resources :cart_items, only: [:create, :update, :destroy]  # 追加

  #get "homes/top"
  root to: "homes#top"

  devise_for :users
  # マイページ
  #get "mypage/show"
  resources :mypage, only: [:show]

  resources :products

  # 注文関連
  #get "orders/new"
  resources :orders, only: [:index, :new, :create] do 
    collection do
      post :confirm   # 注文確認
    end

    member do
      get :complete  # 注文完了
    end
  end
  #get "products/new"
  #post 'products', to: 'products#create'  # 登録

  #get 'products', to: 'products#index'
  #get 'products/:id', to: 'products#show', as: 'product'

  # 商品編集
  #get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
  #patch 'products/:id', to: 'products#update' # 編集

  #delete 'products/:id', to: 'products#destroy', as: 'destroy_product'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
