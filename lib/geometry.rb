# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.

module Geometry
  def self.included(base)
    base.send :helper_method, :calculate_geometry
  end

  def calculate_geometry(material, geometry, line_items, *options)
    on_center = options[0]
    @count = 0
    @suffix = " "
    line_items.each do |l|
        if l.material == material
          if geometry == "rectangle"
            individual_total = rectangle(l.wall_length, l.wall_height)
            @count += individual_total
            @suffix = "sqft"
          elsif geometry == "linear"
            if options[1] == "studs"
              individual_total = stud_count(l.wall_length, l.wall_height, on_center)
              @count += individual_total
              @suffix = "pcs"
            else
              individual_total = linear(l.wall_length, l.wall_height, on_center)
                @count += individual_total
                @suffix = "lft"
            end
          elsif geometry == "triangle"
            individual_total = triangle(l.wall_length, l.wall_height)
            @count += individual_total
            @suffix = "sqft"
          else geometry == "circumference"
            individual_total = circumference(l.wall_length, l.wall_height)
            @count += individual_total
            @suffix = "lft"
          end
        end
     end
      @count.to_s + " " +@suffix
  end

 def rectangle(length, height)
    length*height*1*1
  end

  def triangle(length, height)
    length*height*0.5
  end

  def linear(length, height, on_center)
    length*((height*12) / on_center)
  end

  def circumference(length, height)
    length + height
  end

  def stud_count(length, height, on_center)
    length*12/on_center + 1
  end


end
