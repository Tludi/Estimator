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

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html {redirect_to current_takeoff, :notice => 'Success!'}
        format.json {head :ok}
      else
        format.html {render :action => 'edit'}
        format.json {render :json => @line_item.errors, :status => :uprocessable_entity }
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
        format.html {redirect_to current_takeoff, :notice => "Deleted line item."}
        format.xml  { head :ok }
        format.js {render :template => 'takeoffs/destroy.js.erb', :layout => false }
    end
  end
end
