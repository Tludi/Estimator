class CreateWallLayers < ActiveRecord::Migration
  def self.up
    create_table :wall_layers do |t|
      t.integer :walltype_id
      t.string :material
      t.timestamps
    end
  end

  def self.down
    drop_table :wall_layers
  end
end
