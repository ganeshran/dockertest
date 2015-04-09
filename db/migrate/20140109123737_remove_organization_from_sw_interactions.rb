class RemoveOrganizationFromSwInteractions < ActiveRecord::Migration
  def change
	  remove_column :sw_interactions, :organization
  end
end
