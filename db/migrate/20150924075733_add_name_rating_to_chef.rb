class AddNameRatingToChef < ActiveRecord::Migration
  def change
    add_column :chefs, :name, :string
    add_column :chefs, :rating, :integer
  end
end
