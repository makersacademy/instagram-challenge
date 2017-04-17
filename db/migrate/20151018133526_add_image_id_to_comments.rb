class AddImageIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :image, index: true, foreign_key: true
  end
end
