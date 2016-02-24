class ChangefooterImageTofooterImage2Id < ActiveRecord::Migration
  def change
    rename_column :footers, :footer_image2, :footer_image2_id
    rename_column :footers, :footer_image3, :footer_image3_id
  end
end
