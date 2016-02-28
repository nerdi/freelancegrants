class AddBodycontentImageIdToWelcome < ActiveRecord::Migration
  def change
    add_column :welcomes, :bodycontent_image_id, :string
  end
end
