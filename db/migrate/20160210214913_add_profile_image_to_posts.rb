class AddProfileImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :profile_image_id, :string
  end
end
