class AddImageRefToComment < ActiveRecord::Migration
  def change
    add_reference :image, :image_id, index: true, foreign_key: true
  end
end
