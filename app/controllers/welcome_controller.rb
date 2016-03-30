class WelcomeController < ApplicationController
  def index
    @welcome = Welcome.last #Shows last added Welcome page outta ActiveAdmin
    @category = Category.all
    @subscriber = Subscriber.new
    @category_array = Array.new
    @category.each do |categories|
    	@category_array << categories.category_name
    end
    @category_array

    if params[:q].present?
      redirect_to :controller=>'searches', :action => 'search', :params => params
    end
    @page = Page.all.order([:weight])
  end
end
