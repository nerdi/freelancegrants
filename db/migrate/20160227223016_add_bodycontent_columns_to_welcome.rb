class AddBodycontentColumnsToWelcome < ActiveRecord::Migration
  def change
    add_column :welcomes, :bodycontent_title, :string
    add_column :welcomes, :bodycontent_body, :string
  end
end
