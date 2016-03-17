ActiveAdmin.register Subscriber do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :email, :first_name, :last_name, :interest

  form do |f|
    inputs 'Details' do
      input :email
      input :first_name
      input :last_name
      input :interest
      actions
    end
  end
end