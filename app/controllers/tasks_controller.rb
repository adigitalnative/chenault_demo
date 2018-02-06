class TasksController < ApplicationController

  def new
    set_project
    @task = @project.tasks.new
  end

  def create
    set_project
    @task = @project.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task Created"
      redirect_to project_path(@project)
    else
      # Do something different
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :project_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
