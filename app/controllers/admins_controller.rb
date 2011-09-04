class AdminsController < ApplicationController
  before_filter :admin_required
  def index
    # @admins = Admin.all
    @users = User.all
    @projects = Project.all
    @walltypes = Walltype.all
    @wall_layers = WallLayer.all 
  end

  def show

  end

  def new

  end

  def create

  end

  def edit
  
  end

  def update

  end


end
