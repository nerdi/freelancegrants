class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_footer_components
  helper_method :current_purchase

  def current_purchase
    sesh = session[:purchase_id]
    purch = Purchase.find_by_id(sesh)
    if !session[:purchase_id].nil? && purch.purchase_status_id != 2
      Purchase.find(session[:purchase_id])
    else
      Purchase.new
    end
  end
  def after_sign_in_path_for(resource)
    request.referrer
  end

  private

  def load_footer_components
    @footer_components = Footer.last
  end
end
