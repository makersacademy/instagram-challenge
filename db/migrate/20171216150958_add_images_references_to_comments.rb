class AddImagesReferencesToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :images, foreign_key: true
  end
end
