class CreatePartyOrders < ActiveRecord::Migration
  def change
    create_table :party_orders do |t|
      t.string :name
      t.string :contact_detail

      t.timestamps
    end
  end
end
