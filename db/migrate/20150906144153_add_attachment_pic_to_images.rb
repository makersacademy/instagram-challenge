class AddAttachmentPicToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :images, :pic
  end
end
