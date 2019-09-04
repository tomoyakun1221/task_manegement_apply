class TasksController < ApplicationController
  before_action :set_user
  
  def new
    @task = Task.new
  end
  
  def edit
  end
  
  def index
    @tasks = @user.tasks
  end
  
  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = 'タスク新規作成に成功しました。'
      redirect_to user_tasks_path current_user
    else
      render :new
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def task_params
    params.require(:task).permit(:task_name, :task_detail)
  end
end
