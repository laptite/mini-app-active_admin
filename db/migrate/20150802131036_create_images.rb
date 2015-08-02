class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :viewable, polymorphic: true
      t.string     :type
      t.attachment :attachment
      t.text       :attachment_meta
      
      t.timestamps
    end
    add_index :images, :viewable_id
  end
end
