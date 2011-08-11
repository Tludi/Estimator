class TakeoffsController < ApplicationController
  def index
    @takeoffs = Takeoff.all
  end

  def show
    @takeoff = Takeoff.find(params[:id])
  end

  def new
    @takeoff = Takeoff.new
  end

  def create
    @project = current_user.projects[0]
    @takeoff = @project.takeoffs.build(params[:takeoff])
    if @takeoff.save
      redirect_to @project, :notice => "Successfully created takeoff."
    else
      render :action => 'new'
    end
  end

  def edit
    @takeoff = Takeoff.find(params[:id])
  end

  def update
    @takeoff = Takeoff.find(params[:id])
    if @takeoff.update_attributes(params[:takeoff])
      redirect_to @takeoff, :notice  => "Successfully updated takeoff."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @takeoff = Takeoff.find(params[:id])
    @takeoff.destroy
    redirect_to takeoffs_url, :notice => "Successfully destroyed takeoff."
  end
end
