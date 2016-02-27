class FooterController < ApplicationController
    def show
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      @footer = Footer.find(params[:id])
    end
end
