class WallLayer < ActiveRecord::Base
  # attr_accessible :material

  belongs_to :walltype
end
