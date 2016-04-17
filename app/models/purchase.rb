class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile
  belongs_to :purchase_status
  has_many :purchase_items
  before_create :set_purchase_status
  before_save :update_subtotal

  def subtotal
    purchase_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
	
	private

  def set_purchase_status
    self.purchase_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end


end
