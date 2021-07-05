class AddAttachmentSnappysnapToImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :images do |t|
      t.attachment :snappysnap
    end
  end

  def self.down
    remove_attachment :images, :snappysnap
  end
end
