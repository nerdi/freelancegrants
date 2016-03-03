ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :body, :profile_image, :image

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
      input :title
      input :body, :input_html => {:class => "redactor"}
      input :profile_image, :required => false, :as => :file, destroy: false, :direct => true
      input :image, :required => false, :as => :file, destroy: false, :direct => true
      actions
    end
  end
end
