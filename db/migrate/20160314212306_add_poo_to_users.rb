class AddPooToUsers < ActiveRecord::Migration
  def change
    add_column :users, :poo_bear, :string
  end
end
