class AddUseridToCoupan < ActiveRecord::Migration
  def change
    add_column :coupans, :user_id, :integer
  end
end
