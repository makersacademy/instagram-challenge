class AddAttachmentImageToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :image

    end
    remove_column :posts, :url
  end

  def self.down
    remove_attachment :posts, :image
  end
end
