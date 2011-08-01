class AddDeveloperInfoToCodes < ActiveRecord::Migration
  def self.up
    add_column :codes, :organization, :string
    add_column :codes, :email, :string
    add_column :codes, :support_contact, :string
    add_column :codes, :support_phone, :string
  end

  def self.down
    remove_column :codes, :organization
    remove_column :codes, :email
    remove_column :codes, :support_contact
    remove_column :codes, :support_phone
  end
end
