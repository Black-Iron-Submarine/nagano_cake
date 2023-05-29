Rails.application.routes.draw do
  devise_for :registrations


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    get '/customers/information/edit' => 'customers#edit'
    get '/customers/is_deleted' => 'customers#is_deleted'
    patch '/customers/destroy' => 'customers#destroy'
    resource :customers, only: [:show, :update]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :create, :destroy]

    post '/orders/show' => 'orders#confirm'
    get '/orders/index' => 'orders#complete'
    resources :orders, only: [:new, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
 end
 namespace :admin do
    get '/admin' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
 end
 devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
