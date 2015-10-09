class AddAttachmentPictureToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :photos, :picture
  end
end
