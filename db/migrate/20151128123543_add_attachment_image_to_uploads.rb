class AddAttachmentImageToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :uploads, :image
  end
end
