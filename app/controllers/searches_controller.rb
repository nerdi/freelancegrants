class SearchesController < ApplicationController
  def search
    if params[:q].present?
      @postsearch = Post.search params[:q], fields: [:title, :body], operator: "or", suggest: true
    end
  end
end
