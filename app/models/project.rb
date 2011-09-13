class Project < ActiveRecord::Base
  attr_accessible :name, :address, :owner, :contractor, :bid_date, :start_date

  belongs_to :user
  has_many :devisions
  has_many :takeoffs, :dependent => :destroy 
  has_many :walltypes, :dependent => :destroy

  def hello
    "hello"
  end

end