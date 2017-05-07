class AddAttachmentImageToScenes < ActiveRecord::Migration[5.1]
  def self.up
    change_table :scenes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :scenes, :image
  end
end
