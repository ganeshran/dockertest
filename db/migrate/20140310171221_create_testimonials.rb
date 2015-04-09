class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.text :story
      t.string :imagefile
      t.string :author
      t.timestamps
    end
  end
end
