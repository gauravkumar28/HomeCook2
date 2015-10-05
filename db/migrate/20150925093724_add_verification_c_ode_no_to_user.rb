class AddVerificationCOdeNoToUser < ActiveRecord::Migration
  def change
    add_column :users, :VerificationCode, :integer
  end
end
