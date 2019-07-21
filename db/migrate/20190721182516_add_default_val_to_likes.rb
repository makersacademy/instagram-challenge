class AddDefaultValToLikes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :likes, 0
  end
end
