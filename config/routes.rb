Rails.application.routes.draw do
  get 'todos', to: 'todos#index'
  post 'todos', to: 'todos#create'
  get 'todos/new', as: 'new_todo'
  root 'todos#index'
end
