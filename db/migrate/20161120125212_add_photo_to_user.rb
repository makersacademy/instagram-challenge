class AddPhotoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :Photo, :has_many
  end
end
