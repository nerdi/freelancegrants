ActiveAdmin.register Subscriber do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :email, :first_name, :last_name, :category_ids => []

  form do |f|
    inputs 'Details' do
      input :email
      input :first_name
      input :last_name
      input :categories, :as => :check_boxes, :collection => Category.pluck(:category_name, :id)
      actions
    end
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row "Interests" do |n|
        subscriber.categories.map(&:category_name).join(", ").html_safe
      end
    end
    active_admin_comments
  end
end