Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'admin/books#index', as: :authenticated_root
    end
    unauthenticated do
      root 'public/home#index', as: :unauthenticated_root
    end
  end

  namespace :admin do
    resources :books
  end

  namespace :public do
    resources :home, only: :index
    resources :books, only: :show
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end