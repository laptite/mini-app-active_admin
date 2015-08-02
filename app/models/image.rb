class Image < ActiveRecord::Base
  belongs_to :viewable, polymorphic: true, touch: true
  has_attached_file :attachment
end
