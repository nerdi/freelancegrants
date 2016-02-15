ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    section "Recently updated content" do
      table_for PaperTrail::Version.order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
        column ("Version Number") { |v| link_to v.item, v.item.admin_permalink }
        column ("Type") { |v| v.item_type.underscore.humanize }
        column ("Modified at") { |v| v.created_at.to_s :long }
        #column ("Admin") { |v| link_to AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)] }
      end
    end
    end

    #Here is an example of a simple dashboard with columns and panels.

      columns do
        column do
          panel "Recent Posts" do
            ul do
            end
          end
        end

        column do
          panel "Info" do
            para "Welcome to ActiveAdmin."
          end
        end
    end
  end # content
end
