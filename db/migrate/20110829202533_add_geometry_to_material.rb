class AddGeometryToMaterial < ActiveRecord::Migration
  def self.up
    add_column :materials, :geometry, :string
  end

  def self.down
    remove_column :materials, :geometry
  end
end
