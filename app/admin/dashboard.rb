include ActiveAdmin::ViewsHelper

ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do 
      column do
        panel "Homepage" do
          div do
            homepage_layout(HomePage.published)
          end
        end
      end
    end
  end
end
