class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :menus, :type, :menu_type
  end

  def down
  end
end
