class AddOrganizationIdtoSwInteractions < ActiveRecord::Migration
  def change
	  add_column :sw_interactions, :organization_id, :integer
	  add_index :sw_interactions, :organization_id
  end
end
