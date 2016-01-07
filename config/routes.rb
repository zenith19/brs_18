Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  scope "(:locale)", locale: /en|vn/ do
    root "books#index"
    get "home" => "static_pages#home"
    get "about" => "static_pages#about"
    get "contact" => "static_pages#contact"

    namespace :admin do
      root "books#index"
      resources :categories
      resources :users, only:[:index, :destroy]
      resources :books
      resources :requests, only: [:index, :update]
      resources :users, only: [:edit, :update]
    end

    resources :users, only: [:index, :show, :edit, :update]
    resources :likes, only: [:create, :destroy]
    resources :requests, only: [:index, :new, :create, :update]
    resources :books, only: [:index, :show] do
      resources :reviews
    end
    resources :reviews do
      resources :comments
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :relationships, only: [:create, :destroy]
    resources :comments
    resources :favourites, only: :update
    resources :reading_statuses, only: :update
  end
end
