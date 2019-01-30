class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      redirect_to root_path, notice: 'To-do saved.'
    else
      redirect_to new_todo_path, alert: 'An error has occurred, please try again.'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
