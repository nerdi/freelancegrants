class PurchaseStatus < ActiveRecord::Base
	has_many :purchases
end
