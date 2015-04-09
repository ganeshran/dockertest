class CreateSwInteractions < ActiveRecord::Migration
  def change
    create_table :sw_interactions do |t|
      t.string :organization
      t.float :volunteerHours
      t.string :category
      t.timestamps
    end
  end
end
