class AddCommentToSwInteractions < ActiveRecord::Migration
  def change
	  add_column :sw_interactions, :comment, :text 
  end
end
