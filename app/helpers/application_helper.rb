module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown = markdown.render(text).html_safe
  end

  #active link for bootstrap nav
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ""
  end

  def convert_aud(price)
    number_to_currency(price, :unit => "AUD$")
  end

  def resource_name

  :user

  end

  def resource

  @resource ||= User.new

  end

  def devise_mapping

  @devise_mapping ||= Devise.mappings[:user]

  end
end
