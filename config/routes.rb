Rails.application.routes.draw do
  root 'pages#home'
  resources :articles, only: [:show, :index, :new, :create, :edit,:destroy]
  resources :person, only: [:show, :index, :new, :create]

end
