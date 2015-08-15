class Section < ActiveRecord::Base
  attr_accessor :delete_image, :delete_video

  belongs_to :page

  has_attached_file :image, 
    default_url: ActionController::Base.helpers.image_path('missing.png')
  has_attached_file :video, styles: {
        mp4: {
          format: 'mp4', streaming: true, 
          convert_options: {
            output: { vcodec: => 'libx264', "b:v" => '4000K', "c:a" => "copy" }
          },
          processors: [:ffmpeg, :qtfaststart]
        },
        ogv: {
          format: 'ogv', streaming: true,
          convert_options: { output: { "b:v" => '1200K', "c:a" => "copy" } },
          :processors => [:ffmpeg]
        },
        poster: { format: 'jpg', time: 2 }
      }, 
      use_timestamp: false,
      url:  Paperclip::Attachment.default_options[:url],
      path: "videos/:id/:style/:basename.:extension"
      
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :video, content_type: ["video/mp4", "video/webm"]

  before_save :delete_assets?

  def delete_assets?
    self.image.clear if @delete_image == "1"
    self.video.clear if @delete_video == "1"
  end

end
