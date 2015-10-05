class CreateCoupans < ActiveRecord::Migration
  def change
    create_table :coupans do |t|

      t.timestamps
    end
  end
end
