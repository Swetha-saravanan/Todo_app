Rails.application.routes.draw do
  get 'users/index'
  root 'todos#home'
  match '/add', :to => 'todos#create', :via => :post
  match '/delete/:id', :to => 'todos#delete', :via => :get
  match '/update/:id', :to => 'todos#update', :via => :get
  get 'todos/home'
  get 'todos/index'
  get 'todos/signup'
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
