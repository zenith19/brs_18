Rails.application.routes.draw do

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
      resources :requests, only: [:index]
    end

    resources :users, only: :index
    devise_for :users, controllers: {registrations: "registrations"}
    resources :requests, only: [:index, :new, :create, :update]
  end
end
