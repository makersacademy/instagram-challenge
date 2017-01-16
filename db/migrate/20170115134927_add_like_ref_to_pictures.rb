class AddLikeRefToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :like, foreign_key: true
  end
end
