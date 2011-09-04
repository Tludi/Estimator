class WalltypesController < ApplicationController
  def index
    @counter = 0

    @walltypes = current_project.walltypes 
 
    @walltype = current_project.walltypes.new
    3.times do 
      # @walltype.build_wall_layer
      wall_layer = @walltype.wall_layers.build
    end
  end

  def show
    @walltype = Walltype.find(params[:id])
  end

  def new
    @counter = 0
    @walltype = Walltype.new
    3.times do
      # @walltype.build_wall_layer 
      wall_layer = @walltype.wall_layers.build
  end
  
  end

  def create
    @walltype = current_project.walltypes.build(params[:walltype])
    if @walltype.save
      redirect_to walltypes_path
    else
      render :action => 'new'
    end
  end

  def edit
    @walltype = Walltype.find(params[:id])
  end

  def update
    @walltype = Walltype.find(params[:id])
    if @walltype.update_attributes(params[:walltype])
      redirect_to walltypes_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @walltype = Walltype.find(params[:id])
    @walltype.destroy
    redirect_to walltypes_url
  end
end
