class CreateTakeoffs < ActiveRecord::Migration
  def self.up
    create_table :takeoffs do |t|
      t.string :trade
      t.string :division
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :takeoffs
  end
end
