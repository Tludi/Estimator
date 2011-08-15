class CreateWalltypes < ActiveRecord::Migration
  def self.up
    create_table :walltypes do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :walltypes
  end
end
