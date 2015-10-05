class AddCategoryAndTypeToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :category, :string
    add_column :menus, :type, :string
  end
end
