class PurchaseItemsController < ApplicationController
  def create
    @purchase = current_purchase
    @purchase_item = @purchase.purchase_items.new(purchase_item_params)
    @purchase.save
    session[:purchase_id] = @purchase.id
  end

  def update
    @purchase = current_purchase
    @purchase_item = @purchase.purchase_items.find(params[:id])
    @purchase_item.update_attributes(purchase_item_params)
    @purchase_items = @purchase.purchase_items
  end

  def destroy
    @purchase = current_purchase
    @purchase_item = @purchase.purchase_items.find(params[:id])
    @purchase_item.destroy
    @purchase_items = @purchase.purchase_items
  end
	
	private
  
  def purchase_item_params
    params.require(:purchase_item).permit(:quantity, :profile_id)
  end
end