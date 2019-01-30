Rails.application.routes.draw do
  get 'todos', to: 'todos#index'
  post 'todos', to: 'todos#create'
  get 'todos/new', as: 'new_todo'
  get 'todos/:id', to: 'todos#show', as: 'todo'
  root 'todos#index'
end
