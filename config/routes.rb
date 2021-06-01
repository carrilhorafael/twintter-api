Rails.application.routes.draw do
  post 'comment', to: "comments#create"
  get 'comment', to: "comments#index"
  get 'comment/:id', to: "comments#show"
  put 'comment/:id', to: "comments#update"
  delete 'comment/:id', to: "comments#destroy"
  
  
  post 'posts', to: "posts#create"
  get 'posts', to: "posts#index"
  get 'posts/:id', to: "posts#show"
  put 'posts/:id', to: "posts#update"
  delete 'posts/:id', to: "posts#destroy"
  
  
  post 'users', to: "users#create"
  get 'users', to: "users#index"
  get 'users/:id', to: "users#show"
  put 'users/:id', to: "users#update"
  delete 'users/:id', to: "users#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
