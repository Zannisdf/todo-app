Rails.application.routes.draw do
  get 'todos', to: 'todos#index'

  root 'todos#index'
end
