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
  permit_params :hero_title, :hero_body, :hero_image, :aboutus_title, :aboutus_body, :aboutus_image, :bodycontent_title, :bodycontent_body, :bodycontent_image, :pricing_title, :pricing_body, :pricing_image

  show do
    attributes_table do
      #hero content
      row :hero_title
      row (:hero_body) { markdown(welcome.hero_body) }
      row ("Hero Image")  {
        image_tag(attachment_url(welcome, :hero_image))
      }
      #bodycontent content
      row :bodycontent_title
      row (:bodycontent_body) { markdown(welcome.bodycontent_body) }
      row ("Bodycontent Image")  {
        image_tag(attachment_url(welcome, :bodycontent_image))
      }
      #aboutus content
      row :aboutus_title
      row (:aboutus_body) { markdown(welcome.aboutus_body) }
      row ("About Us Image")  {
        image_tag(attachment_url(welcome, :aboutus_image))
      }
      #pricing content
      row :pricing_title
      row (:pricing_body) { markdown(welcome.pricing_body) }
      row ("Pricing Image")  {
        image_tag(attachment_url(welcome, :pricing_image))
      }
    end
    active_admin_comments
  end
  form do |f|
    inputs 'Details' do
      input :hero_title
      input :hero_body, :input_html => {:class => "redactor"}, :as => :text
      input :hero_image, :required => false, :as => :file, destroy: false, :direct => true, :hint => image_tag(attachment_url(welcome, :hero_image))
      input :bodycontent_title
      input :bodycontent_body, :input_html => {:class => "redactor"}, :as => :text
      input :bodycontent_image, :required => false, :as => :file, destroy: false, :direct => true, :hint => image_tag(attachment_url(welcome, :bodycontent_image))
      input :aboutus_title
      input :aboutus_body, :input_html => {:class => "redactor"}, :as => :text
      input :aboutus_image, :required => false, :as => :file, destroy: false, :direct => true, :hint => image_tag(attachment_url(welcome, :aboutus_image))
      input :pricing_title
      input :pricing_body, :input_html => {:class => "redactor"}, :as => :text
      input :pricing_image, :required => false, :as => :file, destroy: false, :direct => true, :hint => image_tag(attachment_url(welcome, :pricing_image))
      actions
    end
  end
end
