class RemovePictureIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :picture_id, :integer
  end
end
