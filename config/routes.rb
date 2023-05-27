Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :update]
    get '/customers/is_deleted' => 'customers#is_deleted'
    patch '/customers/destroy' => 'customers#destroy'
    resources :cart_items, only: [:index, :update, :create]
    delete '/cart_items/destroy' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :index, :show]
    post '/orders/show' => 'orders#confirm'
    get '/orders/index' => 'orders#complete'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
 end
 namespace :admin do
    get '/admin' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
