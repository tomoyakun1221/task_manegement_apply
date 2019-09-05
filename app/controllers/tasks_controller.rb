class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = 'タスク新規作成に成功しました。'
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = " タスクの内容を更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit      
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    if @task.user_id == current_user.id
      @task.destroy
      flash[:danger] = " タスクの内容を削除しました"
      redirect_to user_tasks_path @user
    end
  end
  
  private
  
  def task_params
    params.require(:task).permit(:task_name, :task_detail)
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
end
