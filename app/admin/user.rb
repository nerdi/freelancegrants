ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :email, :superadmin, :first_name, :last_name, :password

  form do |f|
    inputs 'Details' do
      input :email
      input :first_name
      input :last_name
      input :password
      input :superadmin
      actions
    end
  end
end