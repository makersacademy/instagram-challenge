class AddAttachmentImageToMewments < ActiveRecord::Migration
  def self.up
    change_table :mewments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :mewments, :image
  end
end
