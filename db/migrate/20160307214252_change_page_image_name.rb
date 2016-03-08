class ChangePageImageName < ActiveRecord::Migration
  def change
  	rename_column :pages, :page_image, :page_image_id
  end
end
