class SetDefaultsToReactions < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :likes, ','
    change_column_default :posts, :dislikes, ','
  end
end
