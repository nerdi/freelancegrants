
ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :content, :body, :publisher_id, :image

  form do |f|
    inputs 'Details' do
      input :title, :input_html => {:class => "redactor", id: "redactor_here"}
      input :body, :input_html => {:class => "redactor", id: "redactor_here"}
      actions
    end
  end
end
