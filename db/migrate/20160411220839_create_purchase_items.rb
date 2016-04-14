class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :purchase, index: true, foreign_key: true
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
