class Page < ActiveRecord::Base
  has_many :sections
  
  accepts_nested_attributes_for :sections

  scope :published, -> { where(published: true) }

  before_save :toggle_published

  def toggle_published
    if published_changed? && other_pages_are_published?
      Page.published.first.update_column(:published, !published)
    end
  end

  def other_pages_are_published?
    Page.all.reject{ |p| p == self }.any?{ |c| c.published? }
  end
end
