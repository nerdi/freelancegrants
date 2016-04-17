class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :show_authorize, except: [:index]
  before_filter :find_profile, :only => [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
    @purchases = Purchase.all
    @all_purchase_items = PurchaseItem.all
    @purchase_item = current_purchase.purchase_items.new
    if params[:q].present?
      @profilesearch = Profile.search params[:q], fields: [:title, :body], operator: "or", suggest: true
    end
  end

  def show
    if params[:q].present?
      @profilesearch = Profile.search params[:q], fields: [:title, :body], operator: "or", suggest: true
    else
      @profile = Profile.find(params[:id])
      @current_user = current_user
      if @profile.published
        respond_to do |format|
          format.html # show.slim
          format.xml  { render :xml => @profile }
        end
      else
        redirect_to profiles_path, notice: 'This is not the Profile you are looking for'
      end
    end
  end

  def create
    @profile = Profile.new(params[:profile])
    respond_to do |format|
      if @profile.save
        format.html  { redirect_to(@profile, :notice => 'Profile was successfully created.') }
        format.json  { render :json => @profile, :status => :created, :location => @profile }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @profile = Profile.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Profile was successfully updated.'
        format.html { redirect_to(@profile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors,
  	                :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def show_authorize
    profile_object = Profile.find(params[:id])
    purchase_item = PurchaseItem.where(profile_id:profile_object.id, user_id:current_user)
    if !purchase_item.present? || purchase_item.first.purchase.purchase_status_id != 2
      redirect_to profiles_path, {alert: "Please purchase this profile to view it."}
    end
  end

end