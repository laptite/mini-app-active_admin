class Video < ActiveRecord::Base

  belongs_to :viewable, polymorphic: true, touch: true

  has_attached_file :poster,
    styles: { 
      main: "1280x770",
      listing: "440x"
    },
    default_style: :main

  has_attached_file :attachment, 
    styles: {
      mp4: {
        geometry: "1280x720", format: "mp4", streaming: true, 
        convert_options: {
          output: { vcodec: "libx264", "b:v" => "900K", "c:a" => "copy" }
        },
        processors: [:ffmpeg, :qtfaststart]
      },
      ogv: {
        geometry: "1280x720", format: "ogv", streaming: true, 
        convert_options: {
          output: { "b:v" => '4000K', "c:a" => "copy" }
        },
        processors: [:ffmpeg]  
      }
    }, 
    use_timestamp: false

  after_post_process :assign_content_type

  def assign_content_type
    # --
    # -- Paperclip relies on MimeTypes gem, which returns 'application/video' as the first option for .mp4, when we want 'video/mp4'
    # -- IE accepts only 'video/mp4' so we have to rely on the file command in this case
    # --      
    temporary = attachment.present? ? attachment.queued_for_write[:original] : ''
    upload_type = temporary.present? ? file_type(temporary.path) : ''
    self.attachment.instance_write(:content_type, upload_type) if upload_type.present?
  end
  
  def file_type(path)
    `file --mime-type -b '#{path}'`.try(:strip)
  end

end