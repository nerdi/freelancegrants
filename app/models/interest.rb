class Interest < ActiveRecord::Base
	belongs_to :subscriber
  belongs_to :category

  validates :subscriber_id, :uniqueness => {:scope=>:category_id}
end
