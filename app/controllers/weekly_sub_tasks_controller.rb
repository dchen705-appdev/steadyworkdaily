class WeeklySubTasksController < ApplicationController
  def index
    @weekly_sub_tasks = WeeklySubTask.page(params[:page]).per(10)

    render("weekly_sub_tasks/index.html.erb")
  end

  def show
    @weekly_sub_task = WeeklySubTask.find(params[:id])

    render("weekly_sub_tasks/show.html.erb")
  end

  def new
    @weekly_sub_task = WeeklySubTask.new

    render("weekly_sub_tasks/new.html.erb")
  end

  def create
    @weekly_sub_task = WeeklySubTask.new

    @weekly_sub_task.week_id = params[:week_id]
    @weekly_sub_task.task_id = params[:task_id]
    @weekly_sub_task.task_name = params[:task_name]

    save_status = @weekly_sub_task.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/weekly_sub_tasks/new", "/create_weekly_sub_task"
        redirect_to("/weekly_sub_tasks")
      else
        redirect_back(:fallback_location => "/", :notice => "Weekly sub task created successfully.")
      end
    else
      render("weekly_sub_tasks/new.html.erb")
    end
  end

  def edit
    @weekly_sub_task = WeeklySubTask.find(params[:id])

    render("weekly_sub_tasks/edit.html.erb")
  end

  def update
    @weekly_sub_task = WeeklySubTask.find(params[:id])

    @weekly_sub_task.week_id = params[:week_id]
    @weekly_sub_task.task_id = params[:task_id]
    @weekly_sub_task.task_name = params[:task_name]

    save_status = @weekly_sub_task.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/weekly_sub_tasks/#{@weekly_sub_task.id}/edit", "/update_weekly_sub_task"
        redirect_to("/weekly_sub_tasks/#{@weekly_sub_task.id}", :notice => "Weekly sub task updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Weekly sub task updated successfully.")
      end
    else
      render("weekly_sub_tasks/edit.html.erb")
    end
  end

  def destroy
    @weekly_sub_task = WeeklySubTask.find(params[:id])

    @weekly_sub_task.destroy

    if URI(request.referer).path == "/weekly_sub_tasks/#{@weekly_sub_task.id}"
      redirect_to("/", :notice => "Weekly sub task deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Weekly sub task deleted.")
    end
  end
end
