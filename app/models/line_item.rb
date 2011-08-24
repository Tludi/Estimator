class LineItem < ActiveRecord::Base
  attr_accessible :wall_length, :wall_height, :wall_sides, :floor, :description, :wall_layers, :material, :walltype_id

  belongs_to :takeoff

  validates :wall_length, :wall_height, :presence => true, :numericality => true
  validates_presence_of :walltype_id

end
