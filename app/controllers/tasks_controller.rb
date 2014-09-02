class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :load_task, :only => [:update, :destroy, :edit]

  def index
    # @tasks = policy_scope(challenge.tasks)
    @task = challenge.tasks.new
    render_index
  end

  def edit
  end

  def create
    @task = challenge.tasks.new(task_params)
    authorize(@task)
    respond_to do |format|
      if @task.save
        format.html { redirect_to challenge_tasks_url }
        format.js
      else
        format.html { render_index }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to challenge_tasks_url }
        format.js
      else
        format.html { render_index }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @task.destroy
        format.html { redirect_to challenge_tasks_path, notice: 'You have successfully remove a task' }
        format.js
      else
        format.html { redirect_to challenge_tasks_path, alert: 'Removing task was failure.' }
        format.js { render :js => "alert('remove_fail')" }
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
    @task = @task.becomes(Task)
    authorize(@task)
  end

  def render_index
    @tasks = policy_scope(challenge.tasks)
    render :index
  end

end
