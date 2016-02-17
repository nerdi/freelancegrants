class PostsController < ApplicationController
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
    if params[:q].present?
      @searchpost = Post.__elasticsearch__.search(params[:q])
    end
  end

  def show
    if params[:q].present?
      #@posts = Post.search(params[:q], load:true).result
      @searchpost = Post.__elasticsearch__.search(params[:q])
    else
      @post = Post.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @post }
      end
    end
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        Post.import :force => true
        format.html  { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.json  { render :json => @post, :status => :created, :location => @post }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        Post.import :force => true
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors,
  	                :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
