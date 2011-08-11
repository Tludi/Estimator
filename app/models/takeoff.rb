class Takeoff < ActiveRecord::Base
  attr_accessible :trade, :division

  belongs_to :project
end
