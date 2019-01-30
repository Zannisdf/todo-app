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

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      redirect_to root_path, notice: 'To-do updated.'
    else
      redirect_to edit_todo_path(todo), alert: 'Something went wrong, please try again.'
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to root_path, notice: 'To-do deleted.'
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
