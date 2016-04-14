class AddPriceToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :price, :decimal, precision: 12, scale: 2
  end
end
