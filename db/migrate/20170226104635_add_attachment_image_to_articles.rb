class AddAttachmentImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :articles, :image
  end
end
