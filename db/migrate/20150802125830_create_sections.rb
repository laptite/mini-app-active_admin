class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string     :title
      t.string     :text_position
      t.string     :color
      t.attachment :image
      t.attachment :video
      t.string     :link
      t.integer    :page_id

      t.timestamps
    end
  end
end
