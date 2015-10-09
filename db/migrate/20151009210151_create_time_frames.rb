class CreateTimeFrames < ActiveRecord::Migration
  def change
    create_table :time_frames do |t|
      t.string :time
      t.integer :location_id

      t.timestamps
    end
  end
end
