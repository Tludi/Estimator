class CreateSubdivisions < ActiveRecord::Migration
  def self.up
    create_table :subdivisions do |t|
      t.string :name
      t.integer :division_id
      t.timestamps
    end
  end

  def self.down
    drop_table :subdivisions
  end
end
