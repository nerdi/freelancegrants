class Footer < ActiveRecord::Migration
  def change
    create_table :footers do |t|
      t.string :footer_title1
      t.string :footer_body1
      t.string :footer_image1
      t.string :footer_title2
      t.string :footer_body2
      t.string :footer_image2
      t.string :footer_title3
      t.string :footer_body3
      t.string :footer_image3
      t.timestamps
    end
  end
end
