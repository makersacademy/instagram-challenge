class AddAttachmentAvatarToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :images, :avatar
  end
end
