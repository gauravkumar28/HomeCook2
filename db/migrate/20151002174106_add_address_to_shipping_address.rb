class AddAddressToShippingAddress < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :addrss1, :string
    add_column :shipping_addresses, :address2, :string
    add_column :shipping_addresses, :state, :string
    add_column :shipping_addresses, :city, :string
    add_column :shipping_addresses, :zip, :string
    add_column :shipping_addresses, :phone, :string
  end
end
