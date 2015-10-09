class AddTimeToTimeFrame < ActiveRecord::Migration
  def change
    add_column :time_frames, :time, :string
  end
end
