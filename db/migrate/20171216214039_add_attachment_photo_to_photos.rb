class AddAttachmentPhotoToPhotos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :photos, :photo
  end
end
