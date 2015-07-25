class AddAttachmentCaption:stringImageToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :caption:string
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :photos, :caption:string
    remove_attachment :photos, :image
  end
end
