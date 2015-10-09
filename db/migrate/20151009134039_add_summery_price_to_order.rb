class AddSummeryPriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :summery, :string
    add_column :orders, :price, :integer
  end
end
