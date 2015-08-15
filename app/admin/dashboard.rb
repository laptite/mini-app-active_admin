include ActiveAdmin::ViewsHelper

ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do 
      column do
        panel "Homepage" do
          HomePage.all.each do |page|
            div class: "panel #{ 'published' if page.published }" do
              div do
                homepage_layout(page)
              end
            end
          end
        end
      end
    end
  end
end
