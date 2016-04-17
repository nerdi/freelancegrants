class AddUserIdToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchase_items, :user_id, :integer
  end
end
