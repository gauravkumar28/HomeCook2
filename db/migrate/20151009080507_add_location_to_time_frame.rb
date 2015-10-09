class AddLocationToTimeFrame < ActiveRecord::Migration
  def change
    add_column :time_frames, :location_id, :integer
  end
end
