Rails.application.routes.draw do
  get 'todos', to: 'todos#index'
  get 'todos/new', as: 'new_todo'
  root 'todos#index'
end
