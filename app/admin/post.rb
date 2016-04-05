ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :body, :profile_image, :image, :sections_attributes => [:_destroy, :id,:body, :title, :profile_image, :image, :position]

  show do
    attributes_table do
      #bodycontent content
      post.sections.order("position asc").each do |section|
        row (:title) { markdown(section.title) }
        row (:body) { markdown(section.body) }
      end
    end
    active_admin_comments
  end

  form do |f|
    inputs 'Details' do
      f.has_many :sections, sortable: :position, allow_destroy: true do |s|
        s.input :title, :input_html => {:class => "redactor"}, :as => :text
        s.input :body, :input_html => {:class => "redactor"}, :as => :text
        #s.input :profile_image, :required => false, :as => :file, destroy: false, :direct => true
        #s.input :image, :required => false, :as => :file, destroy: false, :direct => true
      end
    actions
    end
  end
end
