class AddSubTotalToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :subtotal, :decimal, precision: 12, scale: 3
    add_column :purchases, :tax, :decimal, precision: 12, scale: 3
    add_column :purchases, :shipping, :decimal, precision: 12, scale: 3
    add_column :purchases, :total, :decimal, precision: 12, scale: 3
    add_reference :purchases, :purchase_status, index: true, foreign_key: true
  end
end
