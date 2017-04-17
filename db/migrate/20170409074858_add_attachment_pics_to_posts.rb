class AddAttachmentPicsToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :pics
    end
  end

  def self.down
    remove_attachment :posts, :pics
  end
end
