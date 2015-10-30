class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.text :description
      t.string :contact_detail

      t.timestamps
    end
  end
end
