class Account < ActiveRecord::Base
  attr_accessible :account_type, :name
  
  belongs_to  :user

end
