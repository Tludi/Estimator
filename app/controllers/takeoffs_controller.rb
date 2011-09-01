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
    @wall_types = current_project.walltypes
    @materials = Material.all

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

  def total_material_list(line_items)
    materials = Material.all
    materials.each do |m|
      @material_total = Takeoff.calculate_geometry(m.name, m.geometry, line_items)
    end
  end

end
