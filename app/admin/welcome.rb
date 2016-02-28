ActiveAdmin.register Welcome do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  permit_params :hero_title, :hero_body, :hero_image, :aboutus_title, :aboutus_body, :aboutus_image, :bodycontent_title, :bodycontent_body, :bodycontent_image

  form do |f|
    inputs 'Details' do
      input :hero_title
      input :hero_body, :input_html => {:class => "redactor"}, :as => :text
      input :hero_image, :required => false, :as => :file, destroy: false, :direct => true
      input :bodycontent_title
      input :bodycontent_body, :input_html => {:class => "redactor"}, :as => :text
      input :bodycontent_image, :required => false, :as => :file, destroy: false, :direct => true
      input :aboutus_title
      input :aboutus_body, :input_html => {:class => "redactor"}, :as => :text
      input :aboutus_image, :required => false, :as => :file, destroy: false, :direct => true
      actions
    end
  end
end
