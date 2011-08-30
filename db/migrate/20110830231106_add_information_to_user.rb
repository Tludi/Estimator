class AddInformationToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :company_name, :string
    add_column :users, :phone, :string
    add_column :users, :fax, :string
    add_column :users, :address, :string
  end

  def self.down
    remove_column :users, :address
    remove_column :users, :fax
    remove_column :users, :phone
    remove_column :users, :company_name
  end
end
