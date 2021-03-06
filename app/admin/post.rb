ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :body, :profile_image, :image, :sections_attributes => [:_destroy, :id, :body, :title, :profile_image, :image, :position, :image_orientation]

  show do
      post.sections.order("position asc").each do |section|
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
