class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all
  end

  def show
    @line_item = LineItem.find(params[:id])
    
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @wall_layers = Walltype.find_by_id(params[:line_item][:walltype_id]).wall_layers
    count = @wall_layers.length
    digit = 0
    count.times do
      params[:line_item][:material] = @wall_layers[digit].material
      @line_item = current_takeoff.line_items.create(params[:line_item])
      digit += 1
    end
    
    if @line_item.save
      redirect_to current_takeoff, :notice => "Successfully created line item."
    else
      render :action => 'new'
    end

   
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update_attributes(params[:line_item])
      redirect_to current_takeoff
    else
      render :action => 'edit'
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to current_takeoff, :notice => "Deleted line item."
  end
end
