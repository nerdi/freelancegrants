ActiveAdmin.register Footer do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
# permit_params :list, :of, :attributes, :on, :model

  permit_params :footer_title1, :footer_body1, :footer_image1, :footer_title2, :footer_body2, :footer_image2, :footer_title3, :footer_body3, :footer_image3

  form do |f|
    inputs 'Details' do
      input :footer_title1
      input :footer_body1, :input_html => {:class => "redactor"}, :as => :text
      input :footer_image1, :required => false, :as => :file, destroy: false, :direct => true
      input :footer_title2
      input :footer_body2, :input_html => {:class => "redactor"}, :as => :text
      input :footer_image2, :required => false, :as => :file, destroy: false, :direct => true
      input :footer_title3
      input :footer_body3, :input_html => {:class => "redactor"}, :as => :text
      input :footer_image3, :required => false, :as => :file, destroy: false, :direct => true
      actions
    end
  end
end
