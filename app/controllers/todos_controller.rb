class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def create
    todo = Todo.new(permit)
    if todo.save
      render json: todo
    else 
      render json: {"numberOfErrors" => todo.errors.count, "error" => todo.errors.full_messages, "message" => "validationError"}
    end
  end

  def show 
    if Todo.exists?(params[:id])  
      todo = Todo.find(params[:id])
      render json: todo
    else
      render json: {"error" => "The todo id #{params[:id]} doesn't exist. Can't be displayed"}
    end
  end

  def update
    if Todo.exists?(params[:id])
      todo = Todo.update(params[:id], permit)
      render json: todo
    else
      render json: {"error" => "The todo id #{params[:id]} doesn't exist. Can't be updated"}
    end
  end

  def destroy
    if Todo.exists?(params[:id])
      todo = Todo.destroy(params[:id])
      render json: todo
    else
      render json: {"error" => "The todo id #{params[:id]} doesn't exist. Can't be deleted"}
    end
  end

  private
    def permit
      params.require("todo").permit(:text, :done)
    end
end
