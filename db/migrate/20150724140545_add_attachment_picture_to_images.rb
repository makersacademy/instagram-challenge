class AddAttachmentPictureToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :images, :picture
  end
end
