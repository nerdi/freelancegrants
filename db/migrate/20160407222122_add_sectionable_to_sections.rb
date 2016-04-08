class AddSectionableToSections < ActiveRecord::Migration
  def change
    add_reference :sections, :sectionable, polymorphic: true, index: true
  end
end
