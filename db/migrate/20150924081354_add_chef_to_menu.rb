class AddChefToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :chef_id, :integer
  end
end
