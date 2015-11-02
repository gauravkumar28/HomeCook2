class AddAppliedToCoupan < ActiveRecord::Migration
  def change
    add_column :coupans, :applied, :integer, :default => 0
  end
end
