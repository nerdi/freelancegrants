class AddImageToSection < ActiveRecord::Migration
  def change
    add_column :sections, :image_id, :string
  end
end
