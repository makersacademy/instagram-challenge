class AddAttachmentImageToMoments < ActiveRecord::Migration
  def self.up
    change_table :moments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :moments, :image
  end
end
