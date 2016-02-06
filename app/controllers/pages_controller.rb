class PagesController < ApplicationController
    def show
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      @page = Page.find(params[:id])
    end
end
