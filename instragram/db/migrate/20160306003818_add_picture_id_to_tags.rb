class AddPictureIdToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :picture, index: true, foreign_key: true
  end
end
