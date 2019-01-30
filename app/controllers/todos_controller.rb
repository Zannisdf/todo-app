class TodosController < ApplicationController
  before_action :set_todo, except: %i[index new create list]
  def index
    @todos = Todo.order(:id)
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

  def show; end

  def edit; end

  def update
    if @todo.update(todo_params)
      redirect_to root_path, notice: 'To-do updated.'
    else
      redirect_to edit_todo_path(@todo), alert: 'Something went wrong, please try again.'
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path, notice: 'To-do deleted.'
  end

  def complete
    @todo.completed = true
    @todo.save
  end

  def list
    @completed_todos = Todo.where(completed: true)
    @not_completed_todos = Todo.where(completed: false)
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
