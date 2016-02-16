class WelcomeController < ApplicationController
  def index
    if params[:q].present?
      redirect_to :controller=>'searches', :action => 'search', :params => params
    end
  end

end
