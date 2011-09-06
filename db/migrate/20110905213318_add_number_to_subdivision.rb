class AddNumberToSubdivision < ActiveRecord::Migration
  def self.up
    add_column :subdivisions, :sub_number, :string
  end

  def self.down
    remove_column :subdivisions, :sub_number
  end
end