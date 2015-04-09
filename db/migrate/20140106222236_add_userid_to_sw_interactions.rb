class AddUseridToSwInteractions < ActiveRecord::Migration
  def change
	  add_column :sw_interactions, :user_id, :integer
	  add_index :sw_interactions, [:user_id, :created_at]
  end
end
