class Walltype < ActiveRecord::Base
  attr_accessible :name #, :project_id

  belongs_to :project
  has_many :wall_layers, :dependent => :destroy

  accepts_nested_attributes_for :wall_layers, :reject_if => lambda { |a| a[:material].blank? }, :allow_destroy => true
  attr_accessible :wall_layers_attributes


  validates_presence_of :name 
end
