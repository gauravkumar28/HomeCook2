class CreateCartItemtable < ActiveRecord::Migration
  def up
  	create_table :cart_items do |t|
      t.shopping_cart_item_fields
      t.timestamps
    end
  end

  def down
  end
end
