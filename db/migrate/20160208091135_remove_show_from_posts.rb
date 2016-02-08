class RemoveShowFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :show_image_url
  end
end
