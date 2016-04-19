class Profile < ActiveRecord::Base
	has_many :sections, as: :sectionable, dependent: :destroy
  accepts_nested_attributes_for :sections, allow_destroy: true
  attachment :profile_image
  has_many :purchase_items
  has_many :purchases
  default_scope { where(published: true) }
  has_many :users, through: :purchases
  validates :title, presence: true
  validates :short_description, presence: true
end
