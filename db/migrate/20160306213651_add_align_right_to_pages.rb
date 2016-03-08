class AddAlignRightToPages < ActiveRecord::Migration
  def change
    add_column :pages, :align_right, :boolean
  end
end
