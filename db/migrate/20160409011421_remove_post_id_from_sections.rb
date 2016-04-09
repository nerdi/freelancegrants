class RemovePostIdFromSections < ActiveRecord::Migration
  def change
    remove_reference :sections, :post
  end
end
