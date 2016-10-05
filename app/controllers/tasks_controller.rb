class TasksController < ApplicationController

  before_action :find_task, except: [:index, :new, :create]
  
  def index
    @tasks = Task.order("created_at DESC")  
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "Task successfully created."
    else
      render 'new'
    end  
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: "Task successfully deleted."
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :company, :url)
    end

    def find_task
      @task = Task.find(params[:id])
    end
end
