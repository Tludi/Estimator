class TakeoffsController < ApplicationController
  def index
    @takeoffs = Takeoff.all
  end

  def show
    session[:takeoff_id] = nil if session[:takeoff_id]
    @takeoff = Takeoff.find(params[:id])
    session[:takeoff_id] = @takeoff.id
    @line_item = LineItem.new
    @line_items = current_takeoff.line_items
    @total_area = LineItem.total_area
  end

  def new
    @takeoff = Takeoff.new
  end

  def create
    @takeoff = current_project.takeoffs.build(params[:takeoff])
    if @takeoff.save
      redirect_to current_project, :notice => "Successfully created takeoff."
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
    redirect_to current_project, :notice => "Successfully destroyed takeoff."
  end
end
