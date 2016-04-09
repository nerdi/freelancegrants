class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :title
      t.text :body
      t.timestamps null: false
    end
  end
end
