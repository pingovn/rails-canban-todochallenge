class TasksController < ApplicationController
  before_action :load_task, :only => [:update, :destroy]

  def index
    @tasks = challenge.tasks
    @task = Task.new
  end

  def create
    @task = challenge.tasks.new(task_params)
    if @task.save
      redirect_to challenge_tasks_url
    else
      @tasks = challenge.tasks
      render :index
    end
  end

  def update
    if @tasks.update(task_params)
      redirect_to challenge_tasks_url
    else
      render :index
    end
  end

  def destroy
    if @task.destroy
      redirect_to challenge_tasks_path, notice: 'You have successfully remove a task'
    else
      redirect_to challenge_tasks_path, alert: 'Removing task was failure.'
    end
  end

  private

  def challenge
    @challenge ||= Challenge.find(params[:challenge_id])
  end

  def task_params
    params.require(:task).permit(:name, :point, :type)
  end

  def load_task
   @task =  challenge.tasks.find(params[:id])
  end

end
