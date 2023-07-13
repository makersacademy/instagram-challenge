class AddAttachmentImageToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :photo, :image
  end
end
