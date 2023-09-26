Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'books/index'
    get 'books/show'
    get 'books/edit'
  end
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get '/homes/about' => 'homes#about'
    resources :users
    resources :books
  end

  namespace :admin do
    root to: 'books#index'
    resources :users
    resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
