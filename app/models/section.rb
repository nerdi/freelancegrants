class Section < ActiveRecord::Base
  belongs_to :post
  attachment :image
  belongs_to :sectionable, polymorphic: true
end
