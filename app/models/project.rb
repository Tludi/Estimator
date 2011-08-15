class Project < ActiveRecord::Base
  attr_accessible :name, :address, :owner, :contractor, :bid_date, :start_date

  belongs_to :user
  has_many :takeoffs 
  has_many :walltypes
end