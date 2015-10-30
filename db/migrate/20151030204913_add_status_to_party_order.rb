class AddStatusToPartyOrder < ActiveRecord::Migration
  def change
    add_column :party_orders, :status, :string, default: 'requested'
  end
end
