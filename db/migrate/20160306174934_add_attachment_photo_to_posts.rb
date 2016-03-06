class AddAttachmentPhotoToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :posts, :photo
  end
end
