class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :viewable, polymorphic: true
      t.string     :type
      t.attachment :attachment
      t.text       :attachment_meta
      t.attachment :poster
      t.text       :poster_meta

      t.timestamps
    end
    add_index :videos, ["viewable_id"], name: :index_videos_on_viewable_id
    add_index :videos, ["viewable_id", "type"], name: :index_videos_on_viewable_type_and_type
  end
end
