class AddGifRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :gif, foreign_key: true
  end
end
