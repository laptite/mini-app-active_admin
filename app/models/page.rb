class Page < ActiveRecord::Base
  has_many :sections, -> { order(position: :asc) }
  
  accepts_nested_attributes_for :sections

  scope :published, -> { where(published: true) }
end
