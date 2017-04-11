class AddAttachmentImageToInstapics < ActiveRecord::Migration
  def self.up
    change_table :instapics do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :instapics, :image
  end
end
