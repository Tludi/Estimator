class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    session[:project_id] = nil if session[:project_id]
    @project = Project.find(params[:id])
    session[:project_id] = @project.id
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      redirect_to @project, :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path(current_user), :notice => "Successfully deleted project."
  end
end
