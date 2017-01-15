class AddAttachmentImageToPuns < ActiveRecord::Migration
  def self.up
    change_table :puns do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :puns, :image
  end
end
