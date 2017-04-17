class AddAttachmentGramToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :gram
    end
  end

  def self.down
    remove_attachment :photos, :gram
  end
end
