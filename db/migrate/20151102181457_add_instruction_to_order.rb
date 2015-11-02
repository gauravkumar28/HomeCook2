class AddInstructionToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :instruction, :string
  end
end
