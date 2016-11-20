class AddPictureRefToUserthoughts < ActiveRecord::Migration[5.0]
  def change
    add_reference :userthoughts, :picture, foreign_key: true
  end
end
