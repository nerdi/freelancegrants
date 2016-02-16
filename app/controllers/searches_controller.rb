class SearchesController < ApplicationController
  def search
    if params[:q].present?
      #@posts = Post.search(params[:q], load:true).result
      @post = Post.__elasticsearch__.search(params[:q])
    end
  end
end
