class AddAttachmentImageToHipstergrams < ActiveRecord::Migration
  def self.up
    change_table :hipstergrams do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :hipstergrams, :image
  end
end
