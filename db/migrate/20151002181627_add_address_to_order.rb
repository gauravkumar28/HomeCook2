class AddAddressToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :address1, :string
    add_column :orders, :address2, :string
    add_column :orders, :state, :string
    add_column :orders, :city, :string
    add_column :orders, :zip, :string
    add_column :orders, :phone, :string
  end
end
