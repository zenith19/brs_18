Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vn/ do
    root "static_pages#home"
    get "home" => "static_pages#home"
    get "about" => "static_pages#about"
    get "contact" => "static_pages#contact"
    namespace :admin do
      root "books#new"
      resources :categories, only: [:new, :create]
      resources :books, only: [:new, :create, :edit, :update]
    end

    devise_for :users, controllers: {registrations: "registrations"}
    resources :requests, only: [:index, :new, :create]
  end
end
