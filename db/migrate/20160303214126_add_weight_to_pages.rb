class AddWeightToPages < ActiveRecord::Migration
  def change
    add_column :pages, :weight, :float
  end
end
