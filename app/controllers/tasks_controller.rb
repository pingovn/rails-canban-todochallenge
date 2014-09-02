class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :load_task, :only => [:update, :destroy]

  def index
    @tasks = challenge.tasks
    @task = Task.new
  end

  def create
    @task = challenge.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to challenge_tasks_url }
        format.js
      else
        @tasks = challenge.tasks
        format.html { render :index }
        format.js
      end
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
    respond_to do |format|
      if @task.destroy
        format.html { redirect_to challenge_tasks_path, notice: 'You have successfully remove a task' }
        format.js
      else
        format.html { redirect_to challenge_tasks_path, alert: 'Removing task was failure.' }
        format.js { render :js => "alert('remove_fail')"}
      end
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
    @task = challenge.tasks.find(params[:id])
  end

end
