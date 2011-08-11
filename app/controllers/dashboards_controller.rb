class DashboardsController < ApplicationController
  def index
    @dashboards = Dashboard.all
  end

  def show
    @dashboard = Dashboard.find(params[:id])
    @projects = current_user.projects
  end

  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard = Dashboard.new(params[:dashboard])
    if @dashboard.save
      redirect_to @dashboard, :notice => "Successfully created dashboard."
    else
      render :action => 'new'
    end
  end

  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    if @dashboard.update_attributes(params[:dashboard])
      redirect_to @dashboard, :notice  => "Successfully updated dashboard."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dashboard = Dashboard.find(params[:id])
    @dashboard.destroy
    redirect_to dashboards_url, :notice => "Successfully destroyed dashboard."
  end
end
