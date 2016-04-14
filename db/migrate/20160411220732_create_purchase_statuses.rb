class CreatePurchaseStatuses < ActiveRecord::Migration
  def change
    create_table :purchase_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
