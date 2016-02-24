class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_footer_components

  private

  def load_footer_components
    @footer_components = Footer.last
  end

end
