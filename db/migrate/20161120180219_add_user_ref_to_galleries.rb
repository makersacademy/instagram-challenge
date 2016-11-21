class AddUserRefToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_reference :galleries, :user, foreign_key: true
  end
end
