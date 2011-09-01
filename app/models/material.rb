class Material < ActiveRecord::Base
  attr_accessible :name, :spec_division, :price, :geometry, :on_center
  default_scope :order => :name
end
