class Section < ActiveRecord::Base
	belongs_to :post
	belongs_to :sectionable, polymorphic: true
	accepts_nested_attributes_for :sectionable
end
