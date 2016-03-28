class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :poo_bear

      t.timestamps null: false
    end
  end
end
