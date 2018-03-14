Rails.application.routes.draw do
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
