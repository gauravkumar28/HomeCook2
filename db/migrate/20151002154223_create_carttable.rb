class CreateCarttable < ActiveRecord::Migration
  def up
    create_table :carts do |t|
      t.timestamps
    end
  end

  def down
  end
end
