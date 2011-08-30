class CreateGeometries < ActiveRecord::Migration
  def self.up
    create_table :geometries do |t|
      t.integer :material_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :geometries
  end
end
