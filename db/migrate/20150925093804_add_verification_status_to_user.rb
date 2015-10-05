class AddVerificationStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :VerificationStatus, :string
  end
end
