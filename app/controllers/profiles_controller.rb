class ProfilesController < ApplicationController
  before_filter :find_profile, :only => [:show, :edit, :update, :destroy]

  def index
    @profile = Profile.all
    if params[:q].present?
      @profilesearch = Profile.search params[:q], fields: [:title, :body], operator: "or", suggest: true
    end
  end

  def show
    if params[:q].present?
      @profilesearch = Profile.search params[:q], fields: [:title, :body], operator: "or", suggest: true
    else
      @profile = Profile.find(params[:id])
      respond_to do |format|
        format.html # show.slim
        format.xml  { render :xml => @profile }
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
end