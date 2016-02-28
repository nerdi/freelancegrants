class ChangeAboutusImageToAboutusImageId < ActiveRecord::Migration
  def change
    rename_column :welcomes, :aboutus_image, :aboutus_image_id
  end
end
