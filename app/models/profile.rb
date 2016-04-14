class Profile < ActiveRecord::Base
	has_many :sections, as: :sectionable, dependent: :destroy
  accepts_nested_attributes_for :sections, allow_destroy: true
  has_many :purchase_items
  default_scope { where(published: true) }
  has_many :users, through: :purchases
end
