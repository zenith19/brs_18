Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  scope "(:locale)", locale: /en|vn/ do
    root "static_pages#home"
    get "home" => "static_pages#home"
    get "about" => "static_pages#about"
    get "contact" => "static_pages#contact"

    namespace :admin do
      root "books#index"
      resources :categories
      resources :users, only:[:index, :destroy]
      resources :books
      resources :requests, only: [:index, :update]
    end

    resources :users, only: [:index, :show, :edit, :update]
    resources :requests, only: [:index, :new, :create, :update]
    resources :books, only: [:index, :show] do
      resources :reviews
    end
    resources :reviews
  end
end
