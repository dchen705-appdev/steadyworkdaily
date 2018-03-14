class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:self_allocated_daily_work_time, :self_allocated_weekly_work_time])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:self_allocated_daily_work_time, :self_allocated_weekly_work_time])
  end
end
