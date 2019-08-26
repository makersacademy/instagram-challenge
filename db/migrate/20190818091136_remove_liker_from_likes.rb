class RemoveLikerFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :liker, :string
  end
end
