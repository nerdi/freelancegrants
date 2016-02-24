class Welcome < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.string :aboutus_title
      t.string :aboutus_body
      t.string :aboutus_image
      t.string :hero_title
      t.string :hero_body
      t.string :hero_image
 
      t.timestamps
    end
  end
end
