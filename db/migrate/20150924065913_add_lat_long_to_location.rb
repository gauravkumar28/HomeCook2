class AddLatLongToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :lat, :DECIMAL
    add_column :locations, :lng, :DECIMAL
  end
end
