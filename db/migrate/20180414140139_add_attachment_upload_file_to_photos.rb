class AddAttachmentUploadFileToPhotos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :photos do |t|
      t.attachment :upload_file
    end
  end

  def self.down
    remove_attachment :photos, :upload_file
  end
end
