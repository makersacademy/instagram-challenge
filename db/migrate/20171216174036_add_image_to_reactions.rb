class AddImageToReactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :reactions, :image, foreign_key: true
  end
end
