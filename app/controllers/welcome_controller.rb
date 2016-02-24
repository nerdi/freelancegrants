class WelcomeController < ApplicationController
  def index
    @welcome = Welcome.last
    if params[:q].present?
      redirect_to :controller=>'searches', :action => 'search', :params => params
    end
  end
end
