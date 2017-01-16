class AddAttachmentInstaImageToInstaPosts < ActiveRecord::Migration
  def self.up
    change_table :insta_posts do |t|
      t.attachment :insta_image
    end
  end

  def self.down
    remove_attachment :insta_posts, :insta_image
  end
end
