class AddPooBearToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :poo_bear, :string
  end
end
