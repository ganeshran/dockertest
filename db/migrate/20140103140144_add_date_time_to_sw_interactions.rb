class AddDateTimeToSwInteractions < ActiveRecord::Migration
  def change
    add_column :sw_interactions, :activitydate, :datetime
  end
end
