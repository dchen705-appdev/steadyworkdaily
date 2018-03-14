class WeeksController < ApplicationController
  def index
    @weeks = Week.page(params[:page]).per(10)

    render("weeks/index.html.erb")
  end

  def show
    @weekly_sub_task = WeeklySubTask.new
    @week = Week.find(params[:id])

    render("weeks/show.html.erb")
  end

  def new
    @week = Week.new

    render("weeks/new.html.erb")
  end

  def create
    @week = Week.new

    @week.start_datetime = params[:start_datetime]
    @week.end_datetime = params[:end_datetime]
    @week.user_id = params[:user_id]

    save_status = @week.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/weeks/new", "/create_week"
        redirect_to("/weeks")
      else
        redirect_back(:fallback_location => "/", :notice => "Week created successfully.")
      end
    else
      render("weeks/new.html.erb")
    end
  end

  def edit
    @week = Week.find(params[:id])

    render("weeks/edit.html.erb")
  end

  def update
    @week = Week.find(params[:id])

    @week.start_datetime = params[:start_datetime]
    @week.end_datetime = params[:end_datetime]
    @week.user_id = params[:user_id]

    save_status = @week.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/weeks/#{@week.id}/edit", "/update_week"
        redirect_to("/weeks/#{@week.id}", :notice => "Week updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Week updated successfully.")
      end
    else
      render("weeks/edit.html.erb")
    end
  end

  def destroy
    @week = Week.find(params[:id])

    @week.destroy

    if URI(request.referer).path == "/weeks/#{@week.id}"
      redirect_to("/", :notice => "Week deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Week deleted.")
    end
  end
end
