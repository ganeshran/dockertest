class AddToActivityDateToSwInteractionsTable < ActiveRecord::Migration
  def change
	  add_column :sw_interactions, :toactivitydate, :datetime
  end
end
