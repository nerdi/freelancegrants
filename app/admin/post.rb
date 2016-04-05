ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :body, :profile_image, :image, :sections_attributes => [:body, :title, :profile_image, :image]

  show do
    attributes_table do
      #bodycontent content
      row :title
      row (:body) { markdown(post.body) }
      row ("Body Image")  {
        image_tag(attachment_url(post, :image))
      }
    end
    active_admin_comments
  end

  form do |f|
    inputs 'Details' do
      f.inputs do
        f.has_many :sections do |s|
          s.input :title, :input_html => {:class => "redactor"}
          s.input :body, :input_html => {:class => "redactor"}
          #s.input :profile_image, :required => false, :as => :file, destroy: false, :direct => true
          #s.input :image, :required => false, :as => :file, destroy: false, :direct => true
        end
      end
      actions
    end
  end
end
