class Takeoff < ActiveRecord::Base
  attr_accessible :trade, :division

  belongs_to :project
  has_many :line_items


  
end
