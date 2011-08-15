class WallLayersController < ApplicationController
  def index
    @wall_layers = WallLayer.all
  end

  def show
    @wall_layer = WallLayer.find(params[:id])
  end

  def new
    @wall_layer = WallLayer.new
  end

  def create
    @wall_type = Walltype.find(params[:walltype_id])
    @wall_layer = @wall_type.wall_layers.build(params[:wall_layer])

    if @wall_layer.save
      redirect_to @wall_type, :notice => "Successfully created wall layer."
    else
      render :action => 'new'
    end
  end

  def edit
    @wall_layer = WallLayer.find(params[:id])
  end

  def update
    @wall_layer = WallLayer.find(params[:id])
    if @wall_layer.update_attributes(params[:wall_layer])
      redirect_to @wall_layer, :notice  => "Successfully updated wall layer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @wall_layer = WallLayer.find(params[:id])
    @wall_layer.destroy
    redirect_to wall_layers_url, :notice => "Successfully destroyed wall layer."
  end
end
