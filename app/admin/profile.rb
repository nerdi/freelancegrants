ActiveAdmin.register Profile do
	# See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title,:short_description, :profile_image, :price, :published, :sections_attributes => [:_destroy, :id, :body, :title, :image, :position, :image_orientation]

  show do
      if profile.published
        h3 'This profile is published'
      else
        h3 'This profile is hidden'
      end
       div image_tag(attachment_url(profile, :profile_image))
      profile.sections.order("position asc").each do |section|
        h2  markdown(section.title)
        h3  markdown(section.body)
        div image_tag(attachment_url(section, :image))
        hr
      end
    active_admin_comments
  end

  form do |f|
    inputs 'Details' do
      input :title
      input :short_description, :input_html => {:class => "redactor"}, :as => :text
      input :price
      input :profile_image, :required => false, :as => :file, destroy: false, :direct => true
      input :published
      f.has_many :sections, sortable: :position, allow_destroy: true do |s|
        s.input :title, :input_html => {:class => "redactor"}, :as => :text
        s.input :body, :input_html => {:class => "redactor"}, :as => :text
        s.input :image, :required => false, :as => :file, :direct => true
        s.input :image_orientation, :as => :select, :collection => [['Left',"left"], ['Right',"right"], ['Full Screen',"full"]]
        #s.input :profile_image, :required => false, :as => :file, destroy: false, :direct => true
        #s.input :image, :required => false, :as => :file, destroy: false, :direct => true
      end
    actions
    end
  end
end
