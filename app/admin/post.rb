ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :body, :profile_image, :image

  form do |f|
    inputs 'Details' do
      input :title, :input_html => {:class => "redactor", id: "redactor_here"}
      input :body, :input_html => {:class => "redactor", id: "redactor_here"}
      input :profile_image, :required => false, :as => :file, destroy: false, :direct => true
      input :image, :required => false, :as => :file, destroy: false, :direct => true
      actions
    end
  end
end
