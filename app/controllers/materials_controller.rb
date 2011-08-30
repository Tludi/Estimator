class MaterialsController < ApplicationController
  def index
    @materials = Material.all
    @geometry = Geometry.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
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
