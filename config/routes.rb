Rails.application.routes.draw do
  post 'auth/login'
  post 'auth/signup'


  post 'comment/add_like', to: "comment#create_like"
  post 'comment', to: "comment#create"
  get 'comment/:id', to: "comment#show"
  get 'comment', to: "comment#index"
  put 'comment/:id', to: "comment#update"
  delete 'comment/:id', to: "comment#destroy"
  
  
  post 'posts/add_like', to: "posts#create_like"
  post 'posts', to: "posts#create"
  get 'posts/:id', to: "posts#show"
  get 'posts', to: "posts#index"
  put 'posts/:id', to: "posts#update"
  delete 'posts/:id', to: "posts#destroy"
  
  put 'users/add_photo', to: "users#add_photo"
  post 'users/follow', to: "users#follow"
  post 'users', to: "users#create"
  get 'users/:id', to: "users#show"
  get 'users', to: "users#index"
  put 'users/:id', to: "users#update"
  delete 'users/:id', to: "users#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
