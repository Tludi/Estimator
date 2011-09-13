class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include Geometry
  
  protect_from_forgery

  before_filter :login_required
  
end
