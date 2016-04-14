class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_footer_components
  helper_method :current_purchase

  def current_purchase
    if !session[:purchase_id].nil?
      Purchase.find(session[:purchase_id])
    else
      Purchase.new
    end
  end

  private

  def load_footer_components
    @footer_components = Footer.last
  end
end
