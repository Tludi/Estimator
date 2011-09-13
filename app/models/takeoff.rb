class Takeoff < ActiveRecord::Base
  attr_accessible :trade, :division

  belongs_to :project
  has_many :line_items, :dependent => :destroy

 

  def self.calculate_geometry(material, geometry, line_items, *options)
    on_center = options[0]
    @count = 0
    @suffix = " "
    line_items.each do |l|
        if l.material == material
          if geometry == "rectangle"
            individual_total = self.rectangle(l.wall_length, l.wall_height)
            @count += individual_total
            @suffix = "sqft"
          elsif geometry == "linear"
            if options[1] == "studs"
              individual_total = self.stud_count(l.wall_length, l.wall_height, on_center)
              @count += individual_total
              @suffix = "pcs"
            else
              individual_total = self.linear(l.wall_length, l.wall_height, on_center)
                @count += individual_total
                @suffix = "lft"
            end
          elsif geometry == "triangle"
            individual_total = self.triangle(l.wall_length, l.wall_height)
            @count += individual_total
            @suffix = "sqft"
          else geometry == "circumference"
            individual_total = self.circumference(l.wall_length, l.wall_height)
            @count += individual_total
            @suffix = "lft"
          end
        end
     end
      return @count.to_s + " " +@suffix if @count > 0
  end

 def self.rectangle(length, height)
    length*height*1*1
  end

  def self.triangle(length, height)
    length*height*0.5
  end

  def self.linear(length, height, on_center)
    length*((height*12) / on_center)
  end

  def self.circumference(length, height)
    length + height
  end

  def self.stud_count(length, height, on_center)
    length*12/on_center + 1
  end

  def self.calculate(material, length, height)
    case material 
    when /Drywall./
      area = length*height*1*1
      area.to_s + " sqft"
    # when /2x./
    #   studs = length*0.75+1
    #   track = length*2
    #   linear_feet = studs*height + track
    #   linear_feet.to_s + ' lft'
    # when /Fur./
    #   oc = 12
    #   horizontal_piece = length*height*12/oc
    #   horizontal_piece.to_s + ' lft @ 12" oc'
    # when /Re./
    #   oc = 12
    #   horizontal_piece = length*height*12/oc
    #   horizontal_piece.to_s + ' lft @ 12" oc'
    when /Ba./
      area = length*height*1*1
      area.to_s + " sqft"
    end
  end

  def self.locate_walltype(wall_type_id)
    Walltype.find_by_id(wall_type_id).name
  end
  
end
