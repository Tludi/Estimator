class SubdivisionsController < ApplicationController
  def index
    @subdivisions = Subdivision.all
  end

  def show
    @subdivision = Subdivision.find(params[:id])
  end

  def new
    @subdivision = Subdivision.new
  end

  def create
    @division = Division.find(params[:subdivision][:division_id])
    @subdivision = Subdivision.new(params[:subdivision])
    if @subdivision.save
      redirect_to @division, :notice => "Successfully created subdivision."
    else
      render :action => 'new'
    end
  end

  def edit
    @subdivision = Subdivision.find(params[:id])
  end

  def update
    @subdivision = Subdivision.find(params[:id])
    if @subdivision.update_attributes(params[:subdivision])
      redirect_to @subdivision, :notice  => "Successfully updated subdivision."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @subdivision = Subdivision.find(params[:id])
    @subdivision.destroy
    redirect_to subdivisions_url, :notice => "Successfully destroyed subdivision."
  end
end
