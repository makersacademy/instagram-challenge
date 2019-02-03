class AddAttachmentPictureToPics < ActiveRecord::Migration[5.2]
  def self.up
    change_table :pics do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :pics, :picture
  end
end
