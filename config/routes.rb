Rails.application.routes.draw do
  post 'comment/add_like', to: "comments#create_like"
  post 'comment', to: "comments#create"
  get 'comment/:id', to: "comments#show"
  get 'comment', to: "comments#index"
  put 'comment/:id', to: "comments#update"
  delete 'comment/:id', to: "comments#destroy"
  
  
  post 'posts/add_like', to: "posts#create_like"
  post 'posts', to: "posts#create"
  get 'posts/:id', to: "posts#show"
  get 'posts', to: "posts#index"
  put 'posts/:id', to: "posts#update"
  delete 'posts/:id', to: "posts#destroy"
  
  
  post 'users', to: "users#create"
  get 'users/:id', to: "users#show"
  get 'users', to: "users#index"
  put 'users/:id', to: "users#update"
  delete 'users/:id', to: "users#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
