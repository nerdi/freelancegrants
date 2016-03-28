class AddColumnToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :subscriber_id, :integer
    add_column :interests, :category_id, :integer
  end
end
