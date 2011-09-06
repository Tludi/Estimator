class Subdivision < ActiveRecord::Base
  attr_accessible :name, :division_id, :sub_number

  belongs_to :division
end
