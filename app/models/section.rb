class Section < ActiveRecord::Base
  belongs_to :post
  attachment :image
end
