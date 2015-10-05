class AddLandmarkToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :landmark, :string
  end
end
