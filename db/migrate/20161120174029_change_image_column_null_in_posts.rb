class ChangeImageColumnNullInPosts < ActiveRecord::Migration[5.0]
  def change
    change_column_null :posts, :image_data, false
  end
end
