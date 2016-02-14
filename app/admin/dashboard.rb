ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    #Here is an example of a simple dashboard with columns and panels.

      columns do
        column do
          panel "Recent Posts" do
            ul do
            post = Post.find 1
            v = post.versions.last
              li do
                post.versions
              end
              li do
                v.event
              end
              li do
                v.created_at
              end
              li do
                v.whodunnit
              end
              li do
                v.created_at
              end
              li do
                v.previous.object
              end
              li do
                v.object
              end
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
