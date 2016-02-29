class AddPricingToWelcome < ActiveRecord::Migration
  def change
    add_column :welcomes, :pricing_title, :string
    add_column :welcomes, :pricing_body, :string
    add_column :welcomes, :pricing_image_id, :string
  end
end
