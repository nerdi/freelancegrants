class WelcomeController < ApplicationController
  def index
    @welcome = Welcome.last #Shows last added Welcome page outta ActiveAdmin
    if params[:q].present?
      redirect_to :controller=>'searches', :action => 'search', :params => params
    end
  end
end
