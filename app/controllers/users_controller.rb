class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      @user.create_dashboard(:name => @user.username)
      redirect_to dashboard_path(@user)
    else
      render :action => 'new'
    end
  end

  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to dashboard_path(@user), :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
end
