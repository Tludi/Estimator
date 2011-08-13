class LineItem < ActiveRecord::Base
  attr_accessible :wall_length, :wall_height, :wall_sides, :floor, :description, :wall_layers, :material

  belongs_to :takeoff


  def self.total_area()
    # line_item.wall_length * line_item.wall_height * line_item.sides
  end
end
