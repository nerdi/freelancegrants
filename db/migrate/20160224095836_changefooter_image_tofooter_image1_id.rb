class ChangefooterImageTofooterImage1Id < ActiveRecord::Migration
  def change
    rename_column :footers, :footer_image1, :footer_image1_id
  end
end
