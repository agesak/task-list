class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)
    if @task.nil?
      # idk what this is in words..
      head 300
      return
    end
  end

  def new
    # i also dont get this
    # i just copied it from the video
    # why am i overwriting this instance variable?
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description])
    if @task.save
      redirect_to tasks_path
    else
      render :new
      return
    end
  end

end
