class AddShortDescriptionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :short_description, :text
  end
end
