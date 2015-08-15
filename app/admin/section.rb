ActiveAdmin.register Section, { sort_order: :id_asc } do
  permit_params :page_id, :title, :link, :color, :text_position, :image, 
                :delete_image, :video, :delete_video

  config.filters = false
  menu false
  actions :all, except: [:show, :destroy]

  form html: { multipart: true, class: "form" } do |f|
    f.inputs do
      f.input :page, as: :select, collection: HomePage.all, required: true
      f.input :text_position, as: :select, collection: ['top-center', 'center-left-align', 'center', 'center-right-align', 'bottom-center']
      f.input :color, label: 'Title Font Color', as: :select, collection: ['black', 'gray', 'white', 'yellow']
      f.input :title
      f.input :link
      f.input :image, as: :file, hint: (f.object.image.exists? ? image_tag(f.object.image.url, height: '200') : "No image uploaded"), required: true
      f.input :delete_image, as: :boolean, required: false, label: 'Remove' unless f.object.new_record?
      f.input :video, as: :file, hint: (f.object.video.exists? ? video_tag(f.object.video.url, height: '200', autoplay: true, loop: true, controls: true) : "No video uploaded")
      # , required: f.object.home_page.layout == "A"
      f.input :delete_video, as: :boolean, required: false, label: 'Remove' unless f.object.new_record?
    end
    f.actions
  end

  index do
    column :id
    column "Attachment" do |section|
      if section.video.present? && section.image.blank?
        "[Video uploaded]" if section.video
      else
        image_tag section.image.url, height: '75' if section.image.present?
      end
    end
    column :page
    column :title
    column :updated_at
    actions
  end

  show do |section|
    attributes_table do
      row :page
      row :title
      row "Image" do |section|
        image_tag(section.image.url, width: '250') if section.image.exists?
      end
      if section.video.exists?
        row "Video" do |section|
          video_tag(section.video.url, width: '250', autoplay: true, loop: true, controls: true) 
        end
      end
      row :updated_at
    end
  end

  # controller do
  #   def action_methods
  #     super - ['new']
  #   end
  # end
end
