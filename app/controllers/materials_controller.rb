class MaterialsController < ApplicationController
  before_filter :admin_required

  def index
    @materials = Material.all
    @geometry = Geometry.all
  
  end

  def show
    @material = Material.find(params[:id])
    @materials = Material.all
  end

  def new
    @select_options = [['select',''],['12', '1'], ['16', '2'], ['24', '3']]
    @material = Material.new
  end

  def create
    @material = Material.new(params[:material])
    if @material.save
      redirect_to @material, :notice => "Successfully created material."
    else
      render :action => 'new'
    end
  end

  def edit
      @select_options = [['select',''],['12', '12'], ['16', '16'], ['24', '24']]
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    if @material.update_attributes(params[:material])
      redirect_to materials_path, :notice  => "Successfully updated material."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_url, :notice => "Successfully destroyed material."
  end
end
