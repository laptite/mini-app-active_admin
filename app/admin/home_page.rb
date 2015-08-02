ActiveAdmin.register HomePage, { sort_order: :title_asc } do
  permit_params :title, :published, :link, :section_attributes

  config.filters = false
  menu label: "Home Pages"

  actions :all, except: [:show, :destroy]

  form html: { multipart: true, class: "form" }do |f|
    f.inputs do
      f.input :published, as: :boolean
      f.input :title
    end
    f.inputs "Sections" do
      homepage_layout(f.object)
    end
    f.actions
  end

  index do 
    column :published
    column :title
    column :updated_at
    actions
  end

  controller do
    def action_methods
      super - ['new']
    end
  end
end