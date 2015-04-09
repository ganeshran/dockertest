class RenameActivityDateToFromActivityDate < ActiveRecord::Migration
  def change
	  rename_column :sw_interactions, :activitydate, :fromactivitydate
  end
end
