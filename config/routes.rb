Rails.application.routes.draw do
  post 'uploader/image'
  devise_for :users
  root to: "pages#home"
  resources :articles
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
