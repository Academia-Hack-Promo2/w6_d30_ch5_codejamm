class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def create
    todo = Todo.new(permit)
    todo.save
    render json: todo
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def update
    todo = Todo.update(params[:id], permit)
    render json: todo

  end

  def destroy
    todo = Todo.destroy(params[:id])
    render json: todo
  end

  private
    def permit
      params.require("todo").permit(:text, :done)
    end
end
