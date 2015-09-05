class AddAttachmentUploadToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :upload
    end
  end

  def self.down
    remove_attachment :images, :upload
  end
end
