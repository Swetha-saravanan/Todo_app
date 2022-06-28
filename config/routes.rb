Rails.application.routes.draw do
  root 'todos#index'
  match '/add', :to => 'todos#create', :via => :post
  match '/delete/:id', :to => 'todos#delete', :via => :get
  match '/update/:id', :to => 'todos#update', :via => :get
  get 'todos/home'
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
