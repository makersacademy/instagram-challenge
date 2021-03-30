class AddImageRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :image, foreign_key: true
  end
end
