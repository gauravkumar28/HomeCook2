class AddCouponCodeToCoupon < ActiveRecord::Migration
  def change
    add_column :coupans, :code, :string
    add_column :coupans, :discount_type, :string
    add_column :coupans, :discount, :integer
    add_column :coupans, :exppires_at, :datetime
  end
end
