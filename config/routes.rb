Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  resources :jewels, only: %i[index show destroy]
  resources :jewelers, only: :index
  resources :materials, only: :index
  resources :stones, only: :index
end
