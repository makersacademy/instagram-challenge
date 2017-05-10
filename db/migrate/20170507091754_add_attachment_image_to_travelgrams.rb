class AddAttachmentImageToTravelgrams < ActiveRecord::Migration[5.1]
  def self.up
    change_table :travelgrams do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :travelgrams, :image
  end
end
