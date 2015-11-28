class AddAttachmentImageToFilterspams < ActiveRecord::Migration
  def self.up
    change_table :filterspams do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :filterspams, :image
  end
end
