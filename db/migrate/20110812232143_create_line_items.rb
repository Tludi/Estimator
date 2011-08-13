class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :takeoff_id
      t.integer :wall_length
      t.integer :wall_height
      t.integer :wall_sides
      t.integer :floor
      t.text :description
      t.integer :wall_layers
      t.string :material
      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
