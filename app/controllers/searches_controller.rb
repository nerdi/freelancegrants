class SearchesController < ApplicationController
  def search
    if params[:q].present?
      #@posts = Post.search(params[:q], load:true).result
      #@post = Post.__elasticsearch__.search(params[:q])
      @post = Post.search params[:q], fields: [:title, :body], operator: "or", suggest: true
    end
  end
end
