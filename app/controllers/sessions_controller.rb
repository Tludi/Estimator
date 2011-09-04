class SessionsController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user.role == "admin"
      session[:user_id] = user.id
      redirect_to_target_or_default admin_path
    elsif user
      session[:user_id] = user.id
      redirect_to_target_or_default dashboard_path(user)
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:project_id] = nil if session[:project_id]
    session[:user_id] = nil
    redirect_to root_url
  end
end
