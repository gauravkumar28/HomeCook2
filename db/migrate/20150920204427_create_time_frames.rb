class CreateTimeFrames < ActiveRecord::Migration
  def change
    create_table :time_frames do |t|

      t.timestamps
    end
  end
end
