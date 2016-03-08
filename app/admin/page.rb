ActiveAdmin.register Page do

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
	permit_params :title, :body, :featured, :weight, :align_right, :page_image
	form do |f|
	    inputs 'Details' do
			input :title, :input_html => {:class => "redactor"}, :as => :text
	      	input :body, :input_html => {:class => "redactor"}, :as => :text
	      	input :featured, :as => :radio
	      	input :weight
	      	input :align_right, :as => :radio, :collection => [['Yes',true], ['No',false]]
	      	input :page_image, :required => false, :as => :file, destroy: false, :direct => true

	      	actions
	    end
  	end
end
