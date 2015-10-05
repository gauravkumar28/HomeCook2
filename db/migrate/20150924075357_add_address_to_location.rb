class AddAddressToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :street, :string
    add_column :locations, :landmark, :string
    add_column :locations, :city, :string
  end
end
