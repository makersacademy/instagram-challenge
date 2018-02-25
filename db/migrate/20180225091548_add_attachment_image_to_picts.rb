class AddAttachmentImageToPicts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :picts do |t|
      t.attachment :image, null: false
    end
  end

  def self.down
    remove_attachment :picts, :image
  end
end
