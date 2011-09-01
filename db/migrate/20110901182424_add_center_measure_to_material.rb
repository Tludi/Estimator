class AddCenterMeasureToMaterial < ActiveRecord::Migration
  def self.up
    add_column :materials, :on_center, :integer
  end

  def self.down
    remove_column :materials, :on_center
  end
end
