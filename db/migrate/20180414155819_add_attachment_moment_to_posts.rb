class AddAttachmentMomentToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :moment
    end
  end

  def self.down
    remove_attachment :posts, :moment
  end
end
