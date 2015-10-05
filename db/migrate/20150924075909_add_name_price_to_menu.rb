class AddNamePriceToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :name, :string
    add_column :menus, :price, :integer
  end
end
