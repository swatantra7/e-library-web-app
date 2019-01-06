Rails.application.routes.draw do

  devise_for :users, path: 'users'

  devise_scope :user do
    authenticated :user do
      root 'admin/books#index', as: :authenticated_root
      namespace :admin do
        resources :books
        resources :subjects
        resources :students
      end
    end
  end

  devise_for :students, path: 'students'
  devise_scope :student do
    patch '/student/confirmation', to: 'confirmations#update', as: :update_student_confirmation
    authenticated :student do
      root 'students/dashboards#index'
      namespace :students do
        resources :books
      end
    end
  end

  namespace :public do
    resources :home, only: :index
    resources :books, only: :show do
      member do
        get :read
      end
    end
    resources :subjects, only: [] do
      member do
        get :books
      end
    end
  end

  root 'public/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end