class Takeoff < ActiveRecord::Base
  attr_accessible :trade, :division

  belongs_to :project
  has_many :line_items

  def self.drywall_area(length, height)
    length*height*1*1
  end

  def self.total_area(line_items)
    @count = 0
    line_items.each do |l|
      case l
      when l.material == /Dry./
        individual_total = self.drywall_area(l.wall_length, l.wall_height)
        @count += individual_total
      end
      
    end
    @count
  end

  def self.calculate(material, length, height)
    case material 
    when /Drywall./
      area = length*height*1*1
      area.to_s + " sqft"
    when /2x./
      studs = length*0.75+1
      track = length*2
      linear_feet = studs*height + track
      linear_feet.to_s + ' lft @ 16" oc'
    when /Fur./
      oc = 12
      horizontal_piece = length*height*12/oc
      horizontal_piece.to_s + ' lft @ 12" oc'
    when /Re./
      oc = 12
      horizontal_piece = length*height*12/oc
      horizontal_piece.to_s + ' lft @ 12" oc'
    when /Ba./
      area = length*height*1*1
      area.to_s + " sqft"
    end
  end

  def self.locate_walltype(wall_type_id)
    Walltype.find_by_id(wall_type_id).name
  end
  
end
