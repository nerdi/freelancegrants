class CartsController < ApplicationController
  def show
  	@purchase_items = current_purchase.purchase_items
  end
end
