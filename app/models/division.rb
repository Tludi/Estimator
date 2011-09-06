class Division < ActiveRecord::Base
  attr_accessible :name, :division_number, :project_id

  belongs_to :project
  has_many :subdivisions

end
