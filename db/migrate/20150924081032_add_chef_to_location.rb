class AddChefToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :chef_id, :integer
  end
end
