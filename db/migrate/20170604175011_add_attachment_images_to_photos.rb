class AddAttachmentImagesToPhotos < ActiveRecord::Migration[5.0]
  def self.up
    change_table :photos do |t|
      t.attachment :images
    end
  end

  def self.down
    remove_attachment :photos, :images
  end
end
