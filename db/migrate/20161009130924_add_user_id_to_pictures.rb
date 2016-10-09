class AddUserIdToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :user_id, :string
  end
end
