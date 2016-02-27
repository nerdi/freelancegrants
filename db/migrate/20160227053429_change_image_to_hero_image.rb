class ChangeImageToHeroImage < ActiveRecord::Migration
  def change
    rename_column :welcomes, :hero_image, :hero_image_id
  end
end
