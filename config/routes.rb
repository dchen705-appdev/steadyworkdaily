Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "tasks#index"
  # Routes for the Weekly_sub_task resource:
  # CREATE
  get "/weekly_sub_tasks/new", :controller => "weekly_sub_tasks", :action => "new"
  post "/create_weekly_sub_task", :controller => "weekly_sub_tasks", :action => "create"

  # READ
  get "/weekly_sub_tasks", :controller => "weekly_sub_tasks", :action => "index"
  get "/weekly_sub_tasks/:id", :controller => "weekly_sub_tasks", :action => "show"

  # UPDATE
  get "/weekly_sub_tasks/:id/edit", :controller => "weekly_sub_tasks", :action => "edit"
  post "/update_weekly_sub_task/:id", :controller => "weekly_sub_tasks", :action => "update"

  # DELETE
  get "/delete_weekly_sub_task/:id", :controller => "weekly_sub_tasks", :action => "destroy"
  #------------------------------

  # Routes for the Week resource:
  # CREATE
  get "/weeks/new", :controller => "weeks", :action => "new"
  post "/create_week", :controller => "weeks", :action => "create"

  # READ
  get "/weeks", :controller => "weeks", :action => "index"
  get "/weeks/:id", :controller => "weeks", :action => "show"

  # UPDATE
  get "/weeks/:id/edit", :controller => "weeks", :action => "edit"
  post "/update_week/:id", :controller => "weeks", :action => "update"

  # DELETE
  get "/delete_week/:id", :controller => "weeks", :action => "destroy"
  #------------------------------

  # Routes for the Task resource:
  # CREATE
  get "/tasks/new", :controller => "tasks", :action => "new"
  post "/create_task", :controller => "tasks", :action => "create"

  # READ
  get "/tasks", :controller => "tasks", :action => "index"
  get "/tasks/:id", :controller => "tasks", :action => "show"

  # UPDATE
  get "/tasks/:id/edit", :controller => "tasks", :action => "edit"
  post "/update_task/:id", :controller => "tasks", :action => "update"

  # DELETE
  get "/delete_task/:id", :controller => "tasks", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
