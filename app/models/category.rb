class Category < ActiveRecord::Base
	has_many :interests
  has_many :subscribers, through: :interests

  validates :category_name, presence: true
end
