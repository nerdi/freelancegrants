class AddImageOrientationToSection < ActiveRecord::Migration
  def change
    add_column :sections, :image_orientation, :string
  end
end
