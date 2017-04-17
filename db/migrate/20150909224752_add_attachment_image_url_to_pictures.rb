class AddAttachmentImageUrlToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :image_url
    end
  end

  def self.down
    remove_attachment :pictures, :image_url
  end
end
